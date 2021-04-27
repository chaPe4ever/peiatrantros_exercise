import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peiatrantros_exercise/core/controllers/home_controller.dart';
import 'package:peiatrantros_exercise/core/enums/enum_patient_task_type.dart';
import 'package:peiatrantros_exercise/core/models/patient_task_entity.dart';
import 'package:peiatrantros_exercise/globals/helpers.dart';
import 'package:peiatrantros_exercise/ui/shared_widgets/patient_task_card.dart';

class PatientTaskCardList extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isBusy
          ? SizedBox()
          : ListView.separated(
              separatorBuilder: (BuildContext context, int index) =>
                  Helpers.verticalSpace(10.0),
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              itemCount: controller.patientTaskList.length,
              itemBuilder: (BuildContext context, int index) {
                PatientTaskEntity patientTask =
                    controller.patientTaskList[index];
                return InkWell(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  splashColor: Colors.black,
                  onTap: () async {
                    controller.navigateAndHandlePatientTaskAction(index);
                  },
                  child: PatientTaskCard(
                    key: Key('PatientTaskCard $index'),
                    leadingIconAssetPath: patientTask.type.svgIconAssetPath,
                    patientTaskTitle: patientTask.title,
                    patientTaskDueDate: patientTask.dueDate,
                    patientTaskDescription: patientTask.description,
                  ),
                );
              },
            ),
    );
  }
}
