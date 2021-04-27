import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:peiatrantros_exercise/core/contracts/data/I_patient_task_provider.dart';
import 'package:peiatrantros_exercise/core/contracts/general/i_connectivity.dart';
import 'package:peiatrantros_exercise/core/contracts/general/i_navigation.dart';
import 'package:peiatrantros_exercise/core/controllers/base_controller.dart';
import 'package:peiatrantros_exercise/globals/constants.dart';

class BottomNavigationViewController extends SuperController
    with BaseController {
  // Fields
  late IPatientTaskProvider _exampleProviderService;
  late IConnectivity _connectivityService;
  late INavigation _navigationService;
  RxInt _currentNavPageIndex = 0.obs;
  RxString _appBarTitle = ''.obs;

  late List<BottomNavigationBarItem> _bottomNavigationBarItems;

  int get currentNavPageIndex => _currentNavPageIndex.value;
  List<BottomNavigationBarItem> get bottomNavigationBarItems =>
      _bottomNavigationBarItems;

  // Setters
  set currentNavPageIndex(int value) {
    _currentNavPageIndex.value = value;
  }

  // Initialisation - LifeCycle
  @override
  void onInit() async {
    super.onInit();

    _exampleProviderService = Get.find();
    _connectivityService = Get.find();
    _navigationService = Get.find();
    _bottomNavigationBarItems = populateNavBar(withHeight: 36.0);

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

  List<BottomNavigationBarItem> populateNavBar({required double withHeight}) {
    return [
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          kHomeIconAssetPath,
          width: withHeight,
          height: withHeight,
        ),
        // title: Text('hi'),
        label: 'Home',
        backgroundColor: Colors.white,
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          kMyTasksIconAssetPath,
          width: withHeight,
          height: withHeight,
        ),
        label: 'My Tasks',
        backgroundColor: Colors.white,
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          kMyHealthIconAssetPath,
          width: withHeight,
          height: withHeight,
        ),
        label: 'My Health',
        backgroundColor: Colors.white,
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          kServicesIconAssetPath,
          width: withHeight,
          height: withHeight,
        ),
        label: 'Services',
        backgroundColor: Colors.white,
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          kSettingsIconAssetPath,
          width: withHeight,
          height: withHeight,
        ),
        label: 'Settings',
        backgroundColor: Colors.white,
      ),
    ];
  }
}
