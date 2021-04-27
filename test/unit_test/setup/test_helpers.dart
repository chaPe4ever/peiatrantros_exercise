import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mockito/mockito.dart';
import 'package:peiatrantros_exercise/core/contracts/data/I_patient_task_provider.dart';
import 'package:peiatrantros_exercise/core/contracts/general/i_api_auth_provider.dart';
import 'package:peiatrantros_exercise/core/contracts/general/i_connectivity.dart';
import 'package:peiatrantros_exercise/core/contracts/general/i_dialog.dart';
import 'package:peiatrantros_exercise/core/contracts/general/i_navigation.dart';
import 'package:peiatrantros_exercise/core/models/patient_task_entity.dart';

import 'mock_bindings.dart';
import 'mock_channels.dart';

Future<IApiAuthProvider> resetStubAndGetApiAuthProviderMock() async {
  IApiAuthProvider service = Get.find();
  reset(service);

  // stubbing

  return service;
}

Future<IPatientTaskProvider> resetStubAndGetPatientTaskProviderMock(
    {required List<PatientTaskEntity> patientTasksToReturn}) async {
  IPatientTaskProvider service = Get.find();
  reset(service);

  // stubbing
  when(service.getAllPatientTasksByDateTime(dateTIme: DateTime.now()))
      .thenAnswer((_) async => patientTasksToReturn);

  return service;
}

Future<IConnectivity> resetStubAndGetConnectivityServiceMock(
    {bool isConnected = true}) async {
  IConnectivity service = Get.find();
  reset(service);

  // stubbing
  when(service.isConnected).thenAnswer((_) async => isConnected);

  return service;
}

Future<IDialog> resetStubAndGetCustomDialogServiceMock(
    {String title = '',
    String subtitle = '',
    String? msgReturnVal,
    String snackbarTitle = '',
    Color? snackbarBgColor,
    Object? snackbarReturnVal}) async {
  IDialog service = Get.find();
  reset(service);

  // stubbing
  when(service.defaultDialog(title, subtitle))
      .thenAnswer((realInvocation) async => msgReturnVal);

  when(service.snackbar(snackbarTitle,
          bgColor: snackbarBgColor ?? Colors.transparent))
      .thenReturn(snackbarReturnVal ?? null);

  return service;
}

Future<INavigation> resetStubAndGetNavigationServiceMock(
    {dynamic argsToReturn}) async {
  INavigation service = Get.find();
  reset(service);

  // stubbing
  if (argsToReturn != null) {
    when(service.getArgs()).thenAnswer((_) async => argsToReturn);
  }

  return service;
}

Future<void> registerServices() async {
  try {
    initialMockBindings.builder();
    bottomNavigationMockBindings.builder();
    homeViewMockBindings.builder();
  } catch (e) {
    print(e.toString());
  }

  await GetStorage.init();
}

Future<void> unregisterServices() async {
  Get.reset();
  // Close stream-subscription
  // Get.find<IConnectivity>().onClose();
}

void registerChannels() {
  setUpGetStorageMockChannel();
}
