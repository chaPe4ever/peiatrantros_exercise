import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peiatrantros_exercise/core/contracts/general/i_navigation.dart';
import 'package:peiatrantros_exercise/core/controllers/base_controller.dart';
import 'package:peiatrantros_exercise/core/models/patient_task_entity.dart';

class TaskOverviewController extends SuperController with BaseController {
  // Fields
  late INavigation _navigationService;
  Rx<PatientTaskEntity> _selectedPatientTask = PatientTaskEntity().obs;

// Getters
  PatientTaskEntity get selectedPatientTask => _selectedPatientTask.value;
  //Setters

// Init - Lifecycle
  @override
  void onInit() async {
    isBusy = true;
    super.onInit();
    _navigationService = Get.find();

    _selectedPatientTask.value = await _navigationService.getArgs();

    isBusy = false;
  }

  @override
  void onDetached() {
    // TODO: implement onDetached
  }

  @override
  void onInactive() {
    // TODO: implement onInactive
  }

  @override
  void onPaused() {
    // TODO: implement onPaused
  }

  @override
  void onResumed() {
    // TODO: implement onResumed
  }

  Future<bool> onTimePicked(TimeOfDay? timePicked) async {
    if (timePicked != null) {
      DateTime dueDate =
          DateTime.tryParse(_selectedPatientTask.value.dueDate)!.toLocal();

      DateTime completedAt = DateTime(dueDate.year, dueDate.month, dueDate.day,
          timePicked.hour, timePicked.minute);
      _selectedPatientTask.value.completedAt = completedAt.toIso8601String();
      // TODO normally update the DB with the result

      return true;
    }
    return false;
  }
}
