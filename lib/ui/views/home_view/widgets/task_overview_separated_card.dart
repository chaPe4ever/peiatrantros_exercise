import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:peiatrantros_exercise/assets/my_app_theme.dart';
import 'package:peiatrantros_exercise/core/controllers/task_overview_controller.dart';
import 'package:peiatrantros_exercise/core/enums/enum_patient_task_type.dart';
import 'package:peiatrantros_exercise/globals/constants.dart';
import 'package:peiatrantros_exercise/globals/helpers.dart';
import 'package:peiatrantros_exercise/ui/views/home_view/widgets/reusable_task_overview_card.dart';

class TaskOverviewSeparatedCard extends GetView<TaskOverviewController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Created by doctor',
          style: Get.textTheme!.taskOverviewCreatedByDoctorTS,
        ),

        Helpers.verticalSpaceSmall(),

        /// Separated Card
        Container(
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
            padding:
                const EdgeInsets.symmetric(vertical: 15.0, horizontal: 5.0),
            child: Column(
              children: [
                Obx(
                  () => controller.isBusy
                      ? SizedBox()
                      : ReusableTaskOverviewCard(
                          leadingIconAssetPath: controller
                              .selectedPatientTask.type.svgIconAssetPath,
                          title: 'Medicine name',
                          descriptionWidget: Text(
                            controller.selectedPatientTask.title,
                            overflow: TextOverflow.ellipsis,
                            style: Get.textTheme!.taskOverviewDescriptionBoldTS,
                          ),
                        ),
                ),
                Divider(
                  indent: 10.0,
                  endIndent: 10.0,
                  thickness: 1.0,
                  color: Get.theme!.colorScheme.dividerColor,
                ),
                Obx(
                  () => controller.isBusy
                      ? SizedBox()
                      : ReusableTaskOverviewCard(
                          leadingIconAssetPath: kTimeQuantityIconAssetPath,
                          title: 'Time & Quantity',
                          descriptionWidget: Row(
                            children: [
                              Text(
                                Helpers.timeFormatToLocal(
                                  controller.selectedPatientTask.dueDate,
                                ),
                                style: Get
                                    .textTheme!.taskOverviewDescriptionBoldTS,
                              ),
                              Helpers.horizontalSpaceSmall(),
                              Text(
                                Helpers.morningAfternoonGenerate(
                                    controller.selectedPatientTask.dueDate),
                              ),
                              Helpers.horizontalSpaceSmall(),
                              SvgPicture.asset(
                                controller
                                    .selectedPatientTask.type.svgIconAssetPath,
                                color: Get.theme!.colorScheme
                                    .todaysTaskCardSecondaryColor,
                                height: 14.0,
                              ),
                              Helpers.horizontalSpaceSmall(),
                              Text(
                                controller.selectedPatientTask.dose,
                                overflow: TextOverflow.ellipsis,
                                style: Get
                                    .textTheme!.taskOverviewDescriptionBoldTS,
                              ),
                              Helpers.horizontalSpaceSmall(),
                              Text(
                                'pill',
                                overflow: TextOverflow.ellipsis,
                                style: Get
                                    .textTheme!.taskOverviewDescriptionBoldTS,
                              ),
                            ],
                          ),
                        ),
                ),
                Divider(
                  indent: 10.0,
                  endIndent: 10.0,
                  thickness: 1.0,
                  color: Get.theme!.colorScheme.dividerColor,
                ),
                Obx(
                  () => controller.isBusy
                      ? SizedBox()
                      : ReusableTaskOverviewCard(
                          leadingIconAssetPath: kDescriptionIconAssetPath,
                          title: 'Description',
                          descriptionWidget: Text(
                            controller.selectedPatientTask.description,
                            overflow: TextOverflow.ellipsis,
                            style: Get.textTheme!.taskOverviewDescriptionBoldTS,
                          ),
                        ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
