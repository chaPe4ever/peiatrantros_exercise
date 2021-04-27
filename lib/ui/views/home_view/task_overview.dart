import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:peiatrantros_exercise/core/controllers/task_overview_controller.dart';
import 'package:peiatrantros_exercise/ui/views/home_view/widgets/task_overview_separated_card.dart';

class TaskOverview extends GetView<TaskOverviewController> {
  static const String route = '/taskOverview';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(MdiIcons.arrowLeft),
          color: Colors.black,
          onPressed: Get.back,
        ),
        backgroundColor: Colors.white,
        title: Text(
          'Task overview',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TaskOverviewSeparatedCard(),
            Spacer(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.lightBlue)),
                onPressed: () async {
                  TimeOfDay? timePicked = await showTimePicker(
                      context: Get.context!, initialTime: TimeOfDay.now());

                  bool timeHasPicked =
                      await controller.onTimePicked(timePicked);

                  if (timeHasPicked) {
                    Get.back(result: controller.selectedPatientTask);
                  }
                },
                child: Text('Mark it as done'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
