import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:peiatrantros_exercise/core/contracts/general/i_navigation.dart';

class NavigationService implements INavigation {
  @override
  Future getArgs() async {
    await Future.delayed(Duration.zero);
    return Get.arguments;
  }

  @override
  Future navigateOffAllNamed(String route,
      {arguments,
      RoutePredicate? predicate,
      int? id,
      bool preventDuplicates = true,
      Map<String, String>? parameters}) async {
    return await Get.offAllNamed(
      route,
      predicate: predicate,
      arguments: arguments,
      id: id,
      parameters: parameters,
    );
  }

  @override
  Future navigateToNamed(String route,
      {arguments,
      int? id,
      bool preventDuplicates = true,
      Map<String, String>? parameters}) async {
    return await Get.toNamed(
      route,
      arguments: arguments,
      id: id,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
    );
  }

  @override
  Future navigateBack<T>(
      {T? result,
      bool closeOverlays = false,
      bool canPop = true,
      int? id}) async {
    await Future.delayed(Duration.zero);
    Get.back();
  }
}
