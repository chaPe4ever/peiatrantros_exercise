import 'package:flutter/material.dart';

abstract class IDialog {
  Future<T?> defaultDialog<T>(String title, String subtitle,
      {void Function()? onOkPressed, bool? confirmCancelVariation});

  void snackbar<T>(String title, {Color? bgColor});
}
