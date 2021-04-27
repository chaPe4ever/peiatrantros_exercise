import 'package:peiatrantros_exercise/globals/constants.dart';

enum EnumPatientTaskType {
  Medication,
  Feedback,
  Activity,
  Measurement,
}

extension EnumPatientTaskTypeExtension on EnumPatientTaskType {
  String get svgIconAssetPath {
    switch (this) {
      case EnumPatientTaskType.Medication:
        return kMedicationTaskIconAssetPath;
      case EnumPatientTaskType.Feedback:
        return kMeasurementTaskIconAssetPath;
      case EnumPatientTaskType.Activity:
        return kWalkingTaskIconAssetPath;
      case EnumPatientTaskType.Measurement:
        return kBloodPressureIconAssetPath;
    }
  }
}
