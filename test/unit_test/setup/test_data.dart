import 'dart:math';

import 'package:mockito/mockito.dart';
import 'package:peiatrantros_exercise/core/enums/enum_patient_task_type.dart';
import 'package:peiatrantros_exercise/core/models/patient_task_entity.dart';

const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';

Random _rnd = Random(DateTime.now().microsecondsSinceEpoch);

String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
    length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

int getNextRandomInt(int max) => _rnd.nextInt(max - 1) + 1;

/// PatientTaskEntity

class PatientTaskEntityMock extends Fake implements PatientTaskEntity {
  @override
  final String id = getRandomString(5);
  @override
  final EnumPatientTaskType type = EnumPatientTaskType
      .values[_rnd.nextInt(EnumPatientTaskType.values.length - 1) + 1];
  @override
  final String title = getRandomString(5);
  @override
  final String description = getRandomString(5);
  @override
  final String dose = getRandomString(5);
  @override
  final String dueDate = getRandomString(5);
  @override
  final String patientID = getRandomString(5);
  @override
  final String completedAt = getRandomString(5);
}
