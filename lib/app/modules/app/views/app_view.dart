import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

import '../../../constants/colors.dart';
import '../../../constants/dimensions.dart';
import '../../../constants/links.dart';
import '../../../services/purchase_service.dart';
import '../../../services/url_launcher_service.dart';
import '../../finace/controllers/finance_controller.dart';
import '../controllers/app_controller.dart';

class AppView extends GetView<AppController> {
  AppView({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> _tariffs = [
    {
      "backgroundColor": AppColors.CYAN,
      "duration": 'на месяц',
      "price": '150 р.',
      "subtitle": 'Старт',
      "title": 'Тариф',
      "onTap": () async {
        var offerings = await Purchases.getOfferings();
        PurchaseService.makePurchase(offerings.current!.monthly!, 'pro');
      }
    },
    {
      "backgroundColor": AppColors.LIGHT_YELLOW,
      "duration": 'на пол года',
      "price": '500 р.',
      "subtitle": 'Комфорт',
      "title": 'Тариф',
      "onTap": () async {
        var offerings = await Purchases.getOfferings();
        PurchaseService.makePurchase(offerings.current!.sixMonth!, 'pro');
      }
    },
    {
      "backgroundColor": AppColors.LIGHT_PINK,
      "duration": 'бессрочно',
      "price": '990 р.',
      "subtitle": 'Выгодный',
      "title": 'Тариф',
      "onTap": () async {
        var offerings = await Purchases.getOfferings();
        PurchaseService.makePurchase(offerings.current!.lifetime!, 'pro');
      }
    }
  ];

  @override
  Widget build(BuildContext context) {
    Get.put(FinanceController());

    return Scaffold(
        body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  title: Text(
                    'Приложение',
                    style: Theme.of(context).textTheme.headline6!,
                  ),
                  leading: const BackButton(color: Colors.black),
                  pinned: false,
                  floating: true,
                  snap: true,
                  backgroundColor: AppColors.BACKGROUND_COLOR,
                )
              ];
            },
            body: Padding(
              padding: const EdgeInsets.all(Dimensions.SIDE_INDENT),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(() {
                    if (FinanceController.to.subscriptionStatus.value! ==
                        true) {
                      return Text(
                        'Спасибо за покупку!',
                        style: Theme.of(context).textTheme.headline4,
                      );
                    } else {
                      return Column(children: [
                        Text(
                          'Доступ к функционалу - уведомления о дате платежей, сохранение данных разделов платежи, банки',
                          style: Theme.of(context).textTheme.headline6,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: Dimensions.ITEM_INDENT * 3,
                        ),
                        GridView.builder(
                            shrinkWrap: true,
                            itemCount: 3,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 8.0 / 10.0,
                              crossAxisCount: 3,
                            ),
                            itemBuilder: (context, index) {
                              return TariffCard(
                                backgroundColor:
                                    _tariffs[index]['backgroundColor'] as Color,
                                duration: _tariffs[index]['duration'] as String,
                                price: _tariffs[index]['price'] as String,
                                onTap: _tariffs[index]['onTap'] as Function(),
                                subtitle: _tariffs[index]['subtitle'] as String,
                                title: _tariffs[index]['title'] as String,
                              );
                            }),
                        TextButton(
                            onPressed: () async =>
                                await PurchaseService.restorePurchases(),
                            child: Text('Восстановить покупки')),
                        Text(
                          'В случае подписки, она будет автоматически продляться на эквивалентный период, пока вы не отмените ее',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(fontStyle: FontStyle.italic),
                          textAlign: TextAlign.center,
                        ),
                      ]);
                    }
                  }),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                            'Подписывайся на наш инстаграмм - тут много полезного'),
                      ),
                      GestureDetector(
                        onTap: () =>
                            UrlLauncherService.launchURL(Links.instagram),
                        child: Image.asset(
                          'assets/images/instagram.png',
                          height: 40,
                          width: 40,
                        ),
                      )
                    ],
                  )
                ],
              ),
            )));
  }
}

class TariffCard extends StatelessWidget {
  const TariffCard(
      {Key? key,
      required this.backgroundColor,
      required this.duration,
      required this.onTap,
      required this.title,
      required this.subtitle,
      required this.price})
      : super(key: key);

  final Color backgroundColor;
  final String duration;
  final String title;
  final String subtitle;
  final String price;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.BORDER_RADIUS)),
      child: InkWell(
        onTap: onTap,
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.BORDER_RADIUS),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: Colors.white),
            ),
            Text(subtitle,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(color: Colors.white)),
            Text(price,
                style: Theme.of(context)
                    .textTheme
                    .subtitle2!
                    .copyWith(color: Colors.white)),
            Text(
              duration,
              style: Theme.of(context)
                  .textTheme
                  .subtitle2!
                  .copyWith(color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: Dimensions.ITEM_INDENT,
            )
          ],
        ),
      ),
    );
  }
}
