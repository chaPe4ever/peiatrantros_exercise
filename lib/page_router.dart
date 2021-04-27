import 'package:get/get.dart';
import 'package:peiatrantros_exercise/core/contracts/data/I_patient_task_provider.dart';
import 'package:peiatrantros_exercise/core/contracts/general/i_api_auth_provider.dart';
import 'package:peiatrantros_exercise/core/contracts/general/i_connectivity.dart';
import 'package:peiatrantros_exercise/core/contracts/general/i_dialog.dart';
import 'package:peiatrantros_exercise/core/contracts/general/i_navigation.dart';
import 'package:peiatrantros_exercise/core/controllers/bottom_navigation_view_controller.dart';
import 'package:peiatrantros_exercise/core/controllers/home_controller.dart';
import 'package:peiatrantros_exercise/core/controllers/task_overview_controller.dart';
import 'package:peiatrantros_exercise/core/services/data/patient_task_provider_service.dart';
import 'package:peiatrantros_exercise/core/services/general/api_auth_provider_service.dart';
import 'package:peiatrantros_exercise/core/services/general/connectivity_service.dart';
import 'package:peiatrantros_exercise/core/services/general/dialog_service.dart';
import 'package:peiatrantros_exercise/core/services/general/navigation_service.dart';
import 'package:peiatrantros_exercise/ui/views/bottom_nav_view/bottom_navigation_view.dart';
import 'package:peiatrantros_exercise/ui/views/home_view/home_view.dart';
import 'package:peiatrantros_exercise/ui/views/home_view/task_overview.dart';

class PageRouter {
  static final Bindings initialBinding = BindingsBuilder(() {
    Get.lazyPut<IDialog>(() => DialogService(), fenix: true);
    Get.lazyPut<IApiAuthProvider>(() => ApiAuthProviderService(), fenix: true);
    Get.put<IConnectivity>(ConnectivityService(), permanent: true);
    Get.put<INavigation>(NavigationService(), permanent: true);
  });

  static final getPages = [
    GetPage(
      name: HomeView.route,
      page: () => HomeView(),
      binding: BindingsBuilder(() => {
            // Get.lazyPut(() => HomeController()),
            // Get.put<IExampleProvider>(ExampleProviderService()),
          }),
    ),
    GetPage(
      name: BottomNavigationView.route,
      page: () => BottomNavigationView(),
      binding: BindingsBuilder(() => {
            Get.lazyPut(() => BottomNavigationViewController()),
            Get.lazyPut(() => HomeController()),
            Get.put<IPatientTaskProvider>(PatientTaskProviderService()),
          }),
    ),
    GetPage(
      name: TaskOverview.route,
      page: () => TaskOverview(),
      binding: BindingsBuilder(() => {
            Get.lazyPut(() => TaskOverviewController()),
          }),
    )
  ];
}
