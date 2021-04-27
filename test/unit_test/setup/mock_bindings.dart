import 'package:get/get.dart';
import 'package:peiatrantros_exercise/core/contracts/data/I_patient_task_provider.dart';
import 'package:peiatrantros_exercise/core/contracts/general/i_api_auth_provider.dart';
import 'package:peiatrantros_exercise/core/contracts/general/i_connectivity.dart';
import 'package:peiatrantros_exercise/core/contracts/general/i_dialog.dart';
import 'package:peiatrantros_exercise/core/contracts/general/i_navigation.dart';
import 'package:peiatrantros_exercise/core/controllers/bottom_navigation_view_controller.dart';
import 'package:peiatrantros_exercise/core/controllers/home_controller.dart';

import 'mock_instances.dart';

BindingsBuilder initialMockBindings = BindingsBuilder(() {
  Get.lazyPut<IDialog>(() => DialogServiceMock(), fenix: true);
  Get.lazyPut<IApiAuthProvider>(() => ApiAuthProviderServiceMock(),
      fenix: true);
  Get.put<IConnectivity>(ConnectivityServiceMock(), permanent: true);
  Get.put<INavigation>(NavigationServiceMock(), permanent: true);
});

BindingsBuilder homeViewMockBindings = BindingsBuilder(() {
  // Get.lazyPut(() => HomeController());
  // Get.put<IPatientTaskProvider>(PatientTaskProviderServiceMock());
});

BindingsBuilder bottomNavigationMockBindings = BindingsBuilder(() {
  Get.lazyPut(() => BottomNavigationViewController());
  Get.lazyPut(() => HomeController());
  Get.put<IPatientTaskProvider>(PatientTaskProviderServiceMock());
});
