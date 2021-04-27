import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peiatrantros_exercise/core/controllers/bottom_navigation_view_controller.dart';
import 'package:peiatrantros_exercise/ui/views/bottom_nav_view/widgets/appbar_action_list.dart';
import 'package:peiatrantros_exercise/ui/views/home_view/home_view.dart';

class BottomNavigationView extends GetView<BottomNavigationViewController> {
  static const String route = '/bottomNavigationView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'MyApp',
          style: TextStyle(color: Colors.black),
        ),
        // leading: Image.asset(
        //   kIatrosLogoIconAssetPath,
        //   scale: 1.5,
        //   // fit: BoxFit.fitHeight,
        // ),
        actions: [AppBarActionList()],
      ),
      bottomNavigationBar: Theme(
        data: ThemeData(splashColor: Colors.transparent),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.lightBlue,
          backgroundColor: Colors.white,
          elevation: 2.0,
          // iconSize: 10.0,
          currentIndex: controller.currentNavPageIndex,
          onTap: (index) {
            controller.currentNavPageIndex = index;
          },
          items: controller.bottomNavigationBarItems,
        ),
      ),
      body: IndexedStack(
        index: controller.currentNavPageIndex,
        children: [
          HomeView(),
        ],
      ),
    );
  }
}
