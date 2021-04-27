import 'package:peiatrantros_exercise/core/enums/enum_patient_task_type.dart';
import 'package:peiatrantros_exercise/core/models/patient_task_entity.dart';

patientTaskEntityFromJson(PatientTaskEntity data, Map<String, dynamic> json) {
  if (json['id'] != null) {
    data.id = json['id'].toString();
  }
  if (json['type'] != null) {
    data.type = EnumPatientTaskType.values[json['type']];
  }
  if (json['title'] != null) {
    data.title = json['title'].toString();
  }
  if (json['description'] != null) {
    data.description = json['description'].toString();
  }
  if (json['dose'] != null) {
    data.dose = json['dose'].toString();
  }
  if (json['dueDate'] != null) {
    data.dueDate = json['dueDate'].toString();
  }
  if (json['patientID'] != null) {
    data.patientID = json['patientID'].toString();
  }
  if (json['completedAt'] != null) {
    data.completedAt = json['completedAt'].toString();
  }
  return data;
}

Map<String, dynamic> patientTaskEntityToJson(PatientTaskEntity entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['id'] = entity.id;
  data['type'] = entity.type.index;
  data['title'] = entity.title;
  data['description'] = entity.description;
  data['dose'] = entity.dose;
  data['dueDate'] = entity.dueDate;
  data['patientID'] = entity.patientID;
  data['completedAt'] = entity.completedAt;
  return data;
}
