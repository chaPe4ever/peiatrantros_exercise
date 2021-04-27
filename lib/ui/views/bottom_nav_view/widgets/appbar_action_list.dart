import 'package:flutter/material.dart';
import 'package:peiatrantros_exercise/globals/constants.dart';

class AppBarActionList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: 50.0,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(kNotificationBellIconAssetPath),
          Align(
            alignment: Alignment(0.5, 0.5),
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xff2dbaec),
                  border: Border.all(color: Color(0xff2dbaec)),
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              height: 8.0,
              width: 8.0,
            ),
          ),
        ],
      ),
    );
  }
}
