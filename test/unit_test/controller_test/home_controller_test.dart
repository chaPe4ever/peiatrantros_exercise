import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:peiatrantros_exercise/core/controllers/home_controller.dart';
import 'package:peiatrantros_exercise/core/models/patient_task_entity.dart';

import '../setup/test_data.dart';
import '../setup/test_helpers.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    registerChannels();
  });

  setUp(() async {
    await registerServices();
  });

  tearDown(() async {
    await unregisterServices();
  });

  group('HomeControllerTest -', () {
    group('Lifecycle methods -', () {
      test('When controller called, should be and have all fields initialised',
          () async {
        /// Arrange
        List<PatientTaskEntity> patientTasksToReturn = [
          PatientTaskEntityMock()
        ];
        await resetStubAndGetPatientTaskProviderMock(
            patientTasksToReturn: patientTasksToReturn);

        HomeController homeController = Get.find();

        /// Act
        await Future.delayed(Duration.zero);

        /// Assert
        expect(homeController.initialized, true);
        expect(homeController.title, 'Home View');
      });
    });
    group('Public methods -', () {});
  });
}
