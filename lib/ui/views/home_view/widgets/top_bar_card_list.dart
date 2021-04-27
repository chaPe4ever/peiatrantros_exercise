import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peiatrantros_exercise/core/controllers/home_controller.dart';
import 'package:peiatrantros_exercise/core/models/top_home_card_entity.dart';
import 'package:peiatrantros_exercise/globals/helpers.dart';
import 'package:peiatrantros_exercise/ui/shared_widgets/top_home_card.dart';

class TopBarCardList extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height / 4.5,
      child: Obx(
        () => controller.isBusy
            ? SizedBox()
            : ListView.separated(
                padding: EdgeInsets.only(right: 50.0),
                separatorBuilder: (BuildContext context, int index) =>
                    Helpers.horizontalSpace(8.0),
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: controller.topCardList.length,
                itemBuilder: (BuildContext context, int index) {
                  TopHomeCardEntity card = controller.topCardList[index];
                  return TopHomeCard(
                    title: card.title,
                    subtitle: card.subtitle,
                    startColorGradient: card.startColorGradient,
                    endColorGradient: card.endColorGradient,
                    trailingButtonTitle: card.trailingButtonTitle,
                    leadingButtonTitle: card.leadingButtonTitle,
                  );
                },
              ),
      ),
    );
  }
}
