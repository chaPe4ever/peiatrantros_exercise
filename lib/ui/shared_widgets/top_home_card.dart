import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:peiatrantros_exercise/assets/my_app_theme.dart';
import 'package:peiatrantros_exercise/core/controllers/home_controller.dart';
import 'package:peiatrantros_exercise/globals/constants.dart';

class TopHomeCard extends GetView<HomeController> {
  final String title;
  final String subtitle;
  final String leadingButtonTitle;
  final String trailingButtonTitle;
  final Color startColorGradient;
  final Color endColorGradient;
  TopHomeCard({
    required this.title,
    required this.subtitle,
    required this.startColorGradient,
    required this.endColorGradient,
    required this.trailingButtonTitle,
    required this.leadingButtonTitle,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: Get.width - 30),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          gradient: LinearGradient(
            colors: [
              startColorGradient,
              endColorGradient,
            ],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(1.0, 1.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    title,
                    style: Get.textTheme!.topCardTitleTS,
                    textAlign: TextAlign.start,
                  ),
                  // Helpers.verticalSpace(10.0),
                  Text(
                    subtitle,
                    style: Get.textTheme!.topCardSubTitleTS,
                  ),
                  // Helpers.verticalSpace(10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: TextButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.transparent)),
                          onPressed: () {},
                          child: Text(
                            leadingButtonTitle,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white)),
                          onPressed: () {},
                          child: Text(trailingButtonTitle,
                              style: TextStyle(color: Colors.lightBlue)),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Align(
                alignment: Alignment(1.1, -1.3),
                child: SvgPicture.asset(kTopCardIllustrationIconAssetPath),
              )
            ],
          ),
        ),
      ),
    );
  }
}
