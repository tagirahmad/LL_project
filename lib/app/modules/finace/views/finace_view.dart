import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:l_l_app/app/constants/colors.dart';
import 'package:l_l_app/app/constants/dimensions.dart';
import 'package:l_l_app/app/widgets/card_button.dart';
import 'package:l_l_app/app/widgets/finance_popup.dart';
import 'package:l_l_app/app/widgets/round_button.dart';

import '../controllers/finace_controller.dart';

class FinanceView extends GetView<FinaceController> {
  const FinanceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  title: Text(
                    'Финансовый учет',
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
              padding: const EdgeInsets.all(Dimensions.SIDE_INDENT),
              child: Column(children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    CardButton(
                      color: AppColors.LIGHT_GREEN,
                      title: 'Доходы',
                      onPress: () {
                        showDialog<Widget>(
                            context: context,
                            builder: (BuildContext context) {
                              return FinancePopup(
                                title: 'Доходы',
                                backgroundColor: AppColors.LIGHT_GREEN,
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    TextField(
                                      autofocus: true,
                                      style:
                                          const TextStyle(color: Colors.white),
                                      keyboardType: TextInputType.number,
                                      decoration: const InputDecoration(
                                          labelText: 'Доход мужа',
                                          hintText: 'Доход мужа / мес',
                                          hintStyle:
                                              TextStyle(color: Colors.white),
                                          labelStyle:
                                              TextStyle(color: Colors.white)),
                                      onChanged: (String text) {
                                        print(text);
                                      },
                                    ),
                                    TextField(
                                      keyboardType: TextInputType.number,
                                      style:
                                          const TextStyle(color: Colors.white),
                                      decoration: const InputDecoration(
                                          labelText: 'Доход жены',
                                          hintText: 'Доход жены / мес',
                                          hintStyle:
                                              TextStyle(color: Colors.white),
                                          labelStyle:
                                              TextStyle(color: Colors.white)),
                                      onChanged: (String text) {
                                        print(text);
                                      },
                                    ),
                                  ],
                                ),
                              );
                            });
                      },
                    ),
                    CardButton(
                      color: AppColors.LIGHT_YELLOW,
                      title: 'На мечту',
                      onPress: () {},
                    )
                  ],
                ),
                const SizedBox(height: Dimensions.SIDE_INDENT),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    CardButton(
                      color: AppColors.LIGHT_PINK,
                      title: 'Капитал',
                      onPress: () {},
                    ),
                    CardButton(
                      color: AppColors.CYAN,
                      title: 'На карман',
                      onPress: () {},
                    )
                  ],
                ),
                const SizedBox(height: Dimensions.SIDE_INDENT),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    CardButton(
                      color: AppColors.LIGHT_PURPLE,
                      title: 'Платежи',
                      onPress: () {},
                    ),
                    CardButton(
                      color: AppColors.LIGHT_BLUE,
                      title: 'Расходы',
                      onPress: () {},
                    )
                  ],
                )
              ]),
            )));
  }
}
