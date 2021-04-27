import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peiatrantros_exercise/assets/my_app_theme.dart';
import 'package:peiatrantros_exercise/core/contracts/general/i_dialog.dart';
import 'package:peiatrantros_exercise/globals/helpers.dart';

class DialogService implements IDialog {
  @override
  Future<T?> defaultDialog<T>(String title, String subtitle,
      {void Function()? onOkPressed, bool? confirmCancelVariation}) async {
    return await Get.defaultDialog<T>(
      title: '',
      actions: confirmCancelVariation != null
          ? [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: TextButton(
                  child: Text(
                    'continue',
                    style: Get.textTheme?.defaultDialogButtonTS ?? TextStyle(),
                  ),
                  onPressed: () => Get.back(result: true),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: TextButton(
                  child: Text(
                    'cancel',
                    style: Get.textTheme?.defaultDialogButtonTS ?? TextStyle(),
                  ),
                  onPressed: () => Get.back(result: false),
                ),
              ),
            ]
          : [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: TextButton(
                  child: Text(
                    'OK',
                    style: Get.textTheme?.defaultDialogButtonTS ?? TextStyle(),
                  ),
                  onPressed: onOkPressed ?? Get.back,
                ),
              ),
            ],
      content: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            Text(
              title,
              style: Get.textTheme?.defaultDialogButtonTS ?? TextStyle(),
            ),
            Helpers.verticalSpace(15.0),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: Get.textTheme?.defaultDialogButtonTS ?? TextStyle(),
            ),
            Helpers.verticalSpace(15.0),
          ],
        ),
      ),
    );
  }

  @override
  void snackbar<T>(String title, {Color? bgColor}) {
    Get.snackbar<T>(
      '',
      '',
      backgroundColor: bgColor ?? Colors.transparent,
      titleText: Text(
        title,
        textAlign: TextAlign.center,
        style: Get.textTheme?.snackBarMsgTS ?? TextStyle(),
      ),
    );
  }
}
