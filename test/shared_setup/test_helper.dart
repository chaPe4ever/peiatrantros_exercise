import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:peiatrantros_exercise/assets/my_app_theme.dart';
import 'package:peiatrantros_exercise/page_router.dart';
import 'package:peiatrantros_exercise/ui/views/bottom_nav_view/bottom_navigation_view.dart';

GetMaterialApp rootWidget(String initialRoute) => GetMaterialApp(
      initialBinding: PageRouter.initialBinding,
      title: 'IATROS Exercise',
      theme: MyAppTheme.themeData,
      initialRoute: initialRoute,
      getPages: PageRouter.getPages,
    );

Future<void> setupWidget(WidgetTester tester,
    {String initialRoute = BottomNavigationView.route}) async {
  await tester.pumpWidget(rootWidget(initialRoute));

  await tester.pumpAndSettle();
}
