import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:l_l_app/app/constants/dimensions.dart';
import 'package:l_l_app/app/routes/app_pages.dart';

import 'main_content_item.dart';

class MainContent extends StatelessWidget {
  const MainContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15.0, 7.0, 15.0, 10.0),
      child: Column(
        children: <Widget>[
          MainContentItem(
            icon: 'assets/images/account.svg',
            text: 'Главная',
            onTap: () => Get.toNamed<dynamic>(Routes.QUESTIONNAIRE),
          ),
          const SizedBox(height: Dimensions.ITEM_INDENT),
          MainContentItem(
            icon: 'assets/images/check.svg',
            text: 'Финансовые обязательства',
            onTap: () => Get.toNamed<dynamic>(Routes.FINACE),
          ),
          const SizedBox(height: Dimensions.ITEM_INDENT),
          MainContentItem(
            icon: 'assets/images/like.svg',
            text: 'Работа',
            onTap: () => Get.toNamed<dynamic>(Routes.WORK),
          ),
          const SizedBox(height: Dimensions.ITEM_INDENT),
          MainContentItem(
            icon: 'assets/images/gift.svg',
            text: 'Дополнительный заработок',
            onTap: () => Get.toNamed<dynamic>(Routes.ADDITIONAL_INCOME),
          ),
          const SizedBox(height: Dimensions.ITEM_INDENT),
          MainContentItem(
            icon: 'assets/images/cart.svg',
            text: 'Приложение',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
