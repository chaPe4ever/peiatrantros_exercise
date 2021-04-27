import 'package:peiatrantros_exercise/core/models/patient_task_entity.dart';

abstract class IPatientTaskProvider {
  Future<Iterable<PatientTaskEntity>> getAllPatientTasks();
  Future<List<PatientTaskEntity>> getAllPatientTasksByDateTime(
      {required DateTime dateTIme});
}
