import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:l_l_app/app/constants/additional_Income_articles.dart';
import 'package:l_l_app/app/modules/work/models/article.dart';
import 'package:l_l_app/app/routes/app_pages.dart';
import 'package:l_l_app/app/widgets/card_button.dart';
import 'package:l_l_app/app/widgets/finance_popup.dart';
import '../../../constants/colors.dart';
import '../../../constants/dimensions.dart';

import '../controllers/additional_income_controller.dart';

class AdditionalIncomeView extends GetView<AdditionalIncomeController> {
  const AdditionalIncomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  title: Text(
                    'Дополнительный заработок',
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
            body: SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.all(Dimensions.SIDE_INDENT),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SvgPicture.asset(
                            'assets/images/woman.svg',
                            cacheColorFilter: true,
                          ),
                          const SizedBox(
                            height: Dimensions.ITEM_INDENT,
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                                padding:
                                    EdgeInsets.all(Dimensions.SIDE_INDENT - 2),
                                primary: Colors.black,
                                backgroundColor: Colors.white,
                                onSurface: AppColors.LIGHT_BLUE,
                                textStyle:
                                    Theme.of(context).textTheme.headline6,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.BORDER_RADIUS))),
                            child: Text('Биржа фриланса Kwork'),
                            onPressed: () {
                              showDialog<Widget>(
                                  context: context,
                                  builder: (context) {
                                    return FinancePopup(
                                        title: 'Биржа фриланса Kwork',
                                        titleStyle:
                                            TextStyle(color: Colors.black),
                                        content: Text(
                                          freelanceArticle,
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1!
                                              .copyWith(color: Colors.black),
                                        ));
                                  });
                            },
                          ),
                          const SizedBox(
                            height: Dimensions.ITEM_INDENT * 2,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CardButton(
                                    color: AppColors.LIGHT_BLUE,
                                    title: 'Регистрация Kwork',
                                    onPress: () {
                                      showDialog<Widget>(
                                          context: context,
                                          builder: (context) {
                                            return FinancePopup(
                                              title: 'Регистрация на Kwork',
                                              backgroundColor:
                                                  AppColors.LIGHT_BLUE,
                                              content: Text(
                                                kworkRegistrationArticle,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .subtitle1!
                                                    .copyWith(
                                                        color: Colors.white),
                                              ),
                                            );
                                          });
                                    }),
                                CardButton(
                                    color: AppColors.LIGHT_YELLOW,
                                    title: 'Создай свой Kwork',
                                    onPress: () {
                                      showDialog<Widget>(
                                          context: context,
                                          builder: (context) {
                                            return FinancePopup(
                                              title: 'Создай свой Kwork',
                                              backgroundColor:
                                                  AppColors.LIGHT_YELLOW,
                                              content: Text(
                                                createYourKworkArticle,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .subtitle1!
                                                    .copyWith(
                                                        color: Colors.white),
                                              ),
                                            );
                                          });
                                    })
                              ]),
                          const SizedBox(
                            height: Dimensions.ITEM_INDENT,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CardButton(
                                    color: AppColors.LIGHT_PINK,
                                    title: 'Как быть в ТОПе',
                                    onPress: () {
                                      showDialog<Widget>(
                                          context: context,
                                          builder: (context) {
                                            return FinancePopup(
                                              title:
                                                  'Как быть в ТОПе',
                                              backgroundColor:
                                                  AppColors.LIGHT_PINK,
                                              content: Text(
                                                howToBeInTopArticle,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .subtitle1!
                                                    .copyWith(
                                                        color: Colors.white),
                                              ),
                                            );
                                          });
                                    }),
                                CardButton(
                                    color: AppColors.LIGHT_YELLOW,
                                    title: 'Возможности',
                                    onPress: () {
                                      showDialog<Widget>(
                                          context: context,
                                          builder: (context) {
                                            return FinancePopup(
                                              title: 'Возможности',
                                              backgroundColor:
                                                  AppColors.LIGHT_YELLOW,
                                              content: Text(
                                                opportunitiesArticle,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .subtitle1!
                                                    .copyWith(
                                                        color: Colors.white),
                                              ),
                                            );
                                          });
                                    })
                              ]),
                        ])))));
  }
}
