import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peiatrantros_exercise/core/controllers/home_controller.dart';
import 'package:peiatrantros_exercise/ui/views/home_view/widgets/patient_task_card_list.dart';
import 'package:peiatrantros_exercise/ui/views/home_view/widgets/todays_task_see_all_row.dart';
import 'package:peiatrantros_exercise/ui/views/home_view/widgets/top_bar_card_list.dart';

class HomeView extends GetView<HomeController> {
  static const String route = '/homeView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 15.0),
          child: Column(
            children: [
              TopBarCardList(),
              TodaysTaskSeeAllRow(),
              PatientTaskCardList(),
              Align(
                alignment: Alignment.center,
                child: Obx(() => controller.isBusy
                    ? CircularProgressIndicator()
                    : SizedBox()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
