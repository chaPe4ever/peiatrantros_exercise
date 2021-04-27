import 'package:flutter/material.dart';

abstract class INavigation {
  Future getArgs();

  Future navigateToNamed(
    String route, {
    dynamic arguments,
    int? id,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
  });

  Future navigateOffAllNamed(
    String route, {
    dynamic arguments,
    RoutePredicate? predicate,
    int? id,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
  });

  Future navigateBack<T>({
    T? result,
    bool closeOverlays = false,
    bool canPop = true,
    int? id,
  });
}
