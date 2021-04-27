import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peiatrantros_exercise/core/contracts/data/I_patient_task_provider.dart';
import 'package:peiatrantros_exercise/core/contracts/general/i_connectivity.dart';
import 'package:peiatrantros_exercise/core/contracts/general/i_navigation.dart';
import 'package:peiatrantros_exercise/core/controllers/base_controller.dart';
import 'package:peiatrantros_exercise/core/models/patient_task_entity.dart';
import 'package:peiatrantros_exercise/core/models/top_home_card_entity.dart';
import 'package:peiatrantros_exercise/globals/constants.dart';
import 'package:peiatrantros_exercise/ui/views/home_view/task_overview.dart';

class HomeController extends SuperController with BaseController {
  // Fields
  late String title;
  late Rx<int> _rxCounter;
  late IPatientTaskProvider _patientTastProviderService;
  late IConnectivity _connectivityService;
  late INavigation _navigationService;
  List<TopHomeCardEntity> _topCardList = <TopHomeCardEntity>[].obs;
  List<PatientTaskEntity> _patientTaskList = <PatientTaskEntity>[].obs;

  // Getters
  int get counter => _rxCounter.value;

  List<TopHomeCardEntity> get topCardList => _topCardList;
  List<PatientTaskEntity> get patientTaskList => _patientTaskList;

  // Setters
  set patientTaskList(List<PatientTaskEntity> value) {
    _patientTaskList.clear();
    _patientTaskList = value;
  }

  // Initialisation - LifeCycle
  @override
  void onInit() async {
    isBusy = true;
    super.onInit();
    title = 'Home View';
    _rxCounter = 0.obs;
    _patientTastProviderService = Get.find();
    _connectivityService = Get.find();
    _navigationService = Get.find();
    _topCardList = populateTopCardList();
    _patientTaskList = await _patientTastProviderService
        .getAllPatientTasksByDateTime(dateTIme: DateTime.now());
    isBusy = false;

    // Listen to connection changes
    // _connectivityService.connectionStatusController?.stream
    //     .listen((enumConnectivityStatus) {
    //   print(enumConnectivityStatus.toString());
    // });
  }

  @override
  void onDetached() {
    printInfo(info: 'onDetached');
  }

  @override
  void onInactive() {
    printInfo(info: 'onInactive');
  }

  @override
  void onPaused() {
    printInfo(info: 'onPaused');
  }

  @override
  void onResumed() {
    printInfo(info: 'onResumed');
  }

  @override
  void onClose() {
    super.onClose();
  }

  // Methods
  void incrementCounter() async {
    try {
      _rxCounter.value++;
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> onPressed() async {
    var data = await _patientTastProviderService.getAllPatientTasksByDateTime(
        dateTIme: DateTime.now());
    print(data.first.title);
  }

  List<TopHomeCardEntity> populateTopCardList() {
    return [
      TopHomeCardEntity(
        title: kQuickAnamnese,
        leadingButtonTitle: 'Dismiss',
        subtitle: kTopHomeBarSubtitle,
        trailingButtonTitle: 'Start',
        startColorGradient: Color(0xff0069c4),
        endColorGradient: Color(0xff009dff),
      ),
      TopHomeCardEntity(
        title: kQuickAnamnese,
        leadingButtonTitle: 'Dismiss',
        subtitle: kTopHomeBarSubtitle,
        trailingButtonTitle: 'Start',
        startColorGradient: Color(0xff44d7b6),
        endColorGradient: Color(0xff00aeef),
      ),
    ];
  }

  Future<dynamic> _navigateToTaskOverview({required int index}) async {
    PatientTaskEntity selectedPatientTask = _patientTaskList[index];
    return await _navigationService.navigateToNamed(TaskOverview.route,
        arguments: selectedPatientTask);
  }

  Future<void> navigateAndHandlePatientTaskAction(int index) async {
    var result = await _navigateToTaskOverview(index: index);

    if (result is PatientTaskEntity) {
      isBusy = true;

      // Remove task from list that patient marked as done
      patientTaskList.removeAt(index);

      await Future.delayed(Duration.zero);
      isBusy = false;
    }
  }
}
