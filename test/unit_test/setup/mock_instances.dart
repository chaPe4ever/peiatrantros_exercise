import 'package:mockito/mockito.dart';
import 'package:peiatrantros_exercise/core/services/data/patient_task_provider_service.dart';
import 'package:peiatrantros_exercise/core/services/general/api_auth_provider_service.dart';
import 'package:peiatrantros_exercise/core/services/general/connectivity_service.dart';
import 'package:peiatrantros_exercise/core/services/general/dialog_service.dart';
import 'package:peiatrantros_exercise/core/services/general/navigation_service.dart';

class DialogServiceMock extends Mock implements DialogService {}

class ApiAuthProviderServiceMock extends Mock
    implements ApiAuthProviderService {}

class ConnectivityServiceMock extends Mock implements ConnectivityService {}

class NavigationServiceMock extends Mock implements NavigationService {}

class PatientTaskProviderServiceMock extends Mock
    implements PatientTaskProviderService {
  // @override
  // Future<List<PatientTaskEntity>> getAllPatientTasksByDateTime(
  //         {DateTime? dateTIme}) =>
  //     super.noSuchMethod(Invocation.method(
  //       #getAllPatientTasksByDateTime,
  //       [],
  //     ));
}
