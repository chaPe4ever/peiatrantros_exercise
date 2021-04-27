import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:peiatrantros_exercise/assets/my_app_theme.dart';
import 'package:peiatrantros_exercise/globals/helpers.dart';

class PatientTaskCard extends StatelessWidget {
  final String leadingIconAssetPath;
  final String patientTaskTitle;
  final String patientTaskDescription;
  final String patientTaskDueDate;
  PatientTaskCard({
    Key? key,
    required this.leadingIconAssetPath,
    required this.patientTaskTitle,
    required this.patientTaskDueDate,
    required this.patientTaskDescription,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0),
            blurRadius: 2.0,
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 5.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //     CrossAxisAlignment.stretch,
              children: [
                Flexible(
                  child: SvgPicture.asset(leadingIconAssetPath),
                ),
                Helpers.horizontalSpace(10.0),
                Flexible(
                  flex: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        patientTaskTitle,
                        style: Get.textTheme!.todaysTaskCardTitleTS,
                      ),
                      Helpers.verticalSpace(5.0),
                      Text(
                        patientTaskDescription,
                        overflow: TextOverflow.ellipsis,
                        style: Get.textTheme!.todaysTaskCardDescriptionTS,
                      )
                    ],
                  ),
                ),
                // Helpers.verticalSpace(10.0),
                Flexible(
                  flex: 2,
                  child: Text(
                    Helpers.timeFormatToLocal(patientTaskDueDate),
                    style: Get.textTheme!.todaysTaskCardTimeTS,
                  ),
                ),
                Flexible(
                  child: Icon(
                    MdiIcons.chevronRight,
                    color: Get.theme!.colorScheme.todaysTaskCardSecondaryColor,
                  ),
                ),
                // Icon(),
                // Icon(FaIcon(FontAwesomeIcons.gamepad),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
