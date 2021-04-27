import 'package:get/get.dart';
import 'package:peiatrantros_exercise/core/contracts/data/I_patient_task_provider.dart';
import 'package:peiatrantros_exercise/core/contracts/general/i_api_auth_provider.dart';
import 'package:peiatrantros_exercise/core/enums/enum_patient_task_type.dart';
import 'package:peiatrantros_exercise/core/models/patient_task_entity.dart';
import 'package:peiatrantros_exercise/globals/constants.dart';

class PatientTaskProviderService implements IPatientTaskProvider {
  IApiAuthProvider _apiAuthProviderService = Get.find();

  @override
  Future<Iterable<PatientTaskEntity>> getAllPatientTasks() async {
    List<PatientTaskEntity> patientTaskList = <PatientTaskEntity>[];

    try {
      var rawPatientTasks =
          await _apiAuthProviderService.getAsync(path: '$kPatientTasksApiPath');

      for (var rawExample in rawPatientTasks) {
        patientTaskList.add(PatientTaskEntity().fromJson(rawExample));
      }
    } catch (e) {
      printError(info: e.toString());
      rethrow;
    }
    return patientTaskList;
  }

  @override
  Future<List<PatientTaskEntity>> getAllPatientTasksByDateTime(
      {required DateTime dateTIme}) async {
    List<PatientTaskEntity> patientTaskList = <PatientTaskEntity>[];

    try {
      // var rawPatientTasks =
      //     await _apiAuthProviderService.getAsync(path: '$kPatientTasksApiPath');

      // for (var rawExample in rawPatientTasks) {
      //   PatientTaskEntity patientToAdd =
      //       PatientTaskEntity().fromJson(rawExample);
      //   // If is expired continue
      //   if (dateTIme
      //           .compareTo(DateTime.tryParse(patientToAdd.dueDate)!.toLocal()) >
      //       0) {
      //     continue;
      //   }
      //   patientTaskList.add(PatientTaskEntity().fromJson(rawExample));
      // }
    } catch (e) {
      printError(info: e.toString());
      rethrow;
    }
    //TODO remove on real implementation
    patientTaskList.addAll(customPatientTasMockList);
    return patientTaskList;
  }
}

List<PatientTaskEntity> get customPatientTasMockList => [
      PatientTaskEntity.custom(
          '1',
          EnumPatientTaskType.Activity,
          'Activity',
          'Activity is good',
          '1',
          DateTime.now().add(Duration(hours: -1)).toString(),
          '1',
          ''),
      PatientTaskEntity.custom(
          '1',
          EnumPatientTaskType.Feedback,
          'Feedback',
          'Feedback is good',
          '1',
          DateTime.now().add(Duration(hours: -2)).toString(),
          '1',
          ''),
      PatientTaskEntity.custom(
          '1',
          EnumPatientTaskType.Measurement,
          'Measurement',
          'Measurement is good',
          '1',
          DateTime.now().add(Duration(hours: -3)).toString(),
          '1',
          ''),
      PatientTaskEntity.custom(
          '1',
          EnumPatientTaskType.Medication,
          'Medication',
          'Medication is good',
          '1',
          DateTime.now().add(Duration(hours: -4)).toString(),
          '1',
          ''),
    ];
