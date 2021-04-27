import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:peiatrantros_exercise/assets/my_app_theme.dart';
import 'package:peiatrantros_exercise/core/controllers/task_overview_controller.dart';
import 'package:peiatrantros_exercise/globals/helpers.dart';

class ReusableTaskOverviewCard extends GetView<TaskOverviewController> {
  final String leadingIconAssetPath;
  final String title;
  final Widget descriptionWidget;
  ReusableTaskOverviewCard({
    required this.leadingIconAssetPath,
    required this.title,
    required this.descriptionWidget,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //     CrossAxisAlignment.stretch,
          children: [
            Flexible(
              child: controller.isBusy
                  ? SizedBox()
                  : SvgPicture.asset(
                      leadingIconAssetPath,
                      color:
                          Get.theme!.colorScheme.todaysTaskCardSecondaryColor,
                    ),
            ),
            Helpers.horizontalSpace(10.0),
            Flexible(
              flex: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: Get.textTheme!.todaysTaskCardDescriptionTS,
                  ),
                  Helpers.verticalSpace(5.0),
                  descriptionWidget,
                ],
              ),
            ),
            // Helpers.verticalSpace(10.0),

            // Icon(),
            // Icon(FaIcon(FontAwesomeIcons.gamepad),
          ],
        ),
      ],
    );
  }
}
