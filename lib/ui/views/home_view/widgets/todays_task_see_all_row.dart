import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peiatrantros_exercise/assets/my_app_theme.dart';
import 'package:peiatrantros_exercise/core/controllers/home_controller.dart';

class TodaysTaskSeeAllRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(builder: (controller) {
      return controller.isBusy
          ? SizedBox()
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Today\'s task',
                  style: Get.textTheme!.todaysTaskTS,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('See all'),
                )
              ],
            );
    });
  }
}
