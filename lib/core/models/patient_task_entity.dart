import 'package:peiatrantros_exercise/core/enums/enum_patient_task_type.dart';
import 'package:peiatrantros_exercise/generated/json/base/json_convert_content.dart';

class PatientTaskEntity with JsonConvert<PatientTaskEntity> {
  late String id;
  late EnumPatientTaskType type;
  late String title;
  late String description;
  late String dose;
  late String dueDate;
  late String patientID;
  late String completedAt;

  PatientTaskEntity();

  PatientTaskEntity.custom(
    this.id,
    this.type,
    this.title,
    this.description,
    this.dose,
    this.dueDate,
    this.patientID,
    this.completedAt,
  );
}
