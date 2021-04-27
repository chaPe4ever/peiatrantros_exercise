import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:peiatrantros_exercise/assets/my_app_theme.dart';
import 'package:peiatrantros_exercise/page_router.dart';
import 'package:peiatrantros_exercise/ui/views/bottom_nav_view/bottom_navigation_view.dart';

void main() async {
  await GetStorage.init();

  WidgetsFlutterBinding.ensureInitialized();

  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialBinding: PageRouter.initialBinding,
    title: 'PEIATRANTROS Exercise',
    theme: MyAppTheme.themeData,
    initialRoute: BottomNavigationView.route,
    getPages: PageRouter.getPages,
  ));
}
