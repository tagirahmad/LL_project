import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:l_l_app/app/constants/colors.dart';
import 'package:l_l_app/app/constants/dimensions.dart';
import 'package:l_l_app/app/modules/finace/helpers/on_text_changed_helper.dart';
import 'package:l_l_app/app/modules/finace/helpers/sum_helper.dart';
import 'package:l_l_app/app/modules/finace/helpers/text_editing_controller_helper.dart';
import 'package:l_l_app/app/widgets/card_button.dart';
import 'package:l_l_app/app/widgets/finance_popup.dart';

import '../controllers/finance_controller.dart';

class FinanceView extends GetView<FinanceController> {
  const FinanceView({Key? key}) : super(key: key);

  String _showDropdownButtonValue(FinanceController controller) {
    if (controller.finance.value!.fund != null &&
        controller.finance.value!.fund!.percents != null) {
      return controller.finance.value!.fund!.percents.toString() + '%';
    } else {
      return '10%';
    }
  }

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
                child: GetBuilder<FinanceController>(
                    builder: (FinanceController controller) {
                  return Column(children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        CardButton(
                          color: AppColors.LIGHT_GREEN,
                          showSubtitle: () =>
                              SumHelper.showSumIncomeFromController(controller),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        TextField(
                                          controller: FinanceController
                                              .to.husbandIncomeController
                                            ..text = TextEditingControllerHelper
                                                .showHusbandIncomeToTextEditingController(
                                                    controller),
                                          autofocus: true,
                                          style: const TextStyle(
                                              color: Colors.white),
                                          keyboardType: TextInputType.number,
                                          decoration: const InputDecoration(
                                              labelText: 'Доход мужа / мес',
                                              hintText: 'руб. / мес',
                                              hintStyle: TextStyle(
                                                  color: Colors.white),
                                              labelStyle: TextStyle(
                                                  color: Colors.white)),
                                          onChanged: (String text) =>
                                              OnTextChangedHelper
                                                  .onChangedHusbandIncome(
                                                      text, controller),
                                        ),
                                        TextField(
                                          controller: FinanceController
                                              .to.wifeIncomeController
                                            ..text = TextEditingControllerHelper
                                                .showWifeIncomeToTextEditingController(
                                                    controller),
                                          keyboardType: TextInputType.number,
                                          style: const TextStyle(
                                              color: Colors.white),
                                          decoration: const InputDecoration(
                                              labelText: 'Доход жены / мес',
                                              hintText: 'руб. / мес',
                                              hintStyle: TextStyle(
                                                  color: Colors.white),
                                              labelStyle: TextStyle(
                                                  color: Colors.white)),
                                          onChanged: (String text) =>
                                              OnTextChangedHelper
                                                  .onChangedWifeIncome(
                                                      text, controller),
                                        ),
                                        TextField(
                                          controller: FinanceController
                                              .to.additionalIncomeController
                                            ..text = TextEditingControllerHelper
                                                .showAdditionalIncomeToTextEditingController(
                                                    controller),
                                          keyboardType: TextInputType.number,
                                          style: const TextStyle(
                                              color: Colors.white),
                                          decoration: const InputDecoration(
                                              labelText:
                                                  'Дополнительный заработок / мес',
                                              hintText: 'руб. / мес',
                                              hintStyle: TextStyle(
                                                  color: Colors.white),
                                              labelStyle: TextStyle(
                                                  color: Colors.white)),
                                          onChanged: (String text) =>
                                              OnTextChangedHelper
                                                  .onChangedAdditionalIncome(
                                                      text, controller),
                                        ),
                                      ],
                                    ),
                                  );
                                });
                          },
                        ),
                        CardButton(
                          showSubtitle: () =>
                              SumHelper.showSumIncomeFromController(controller),
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
                          showSubtitle: () =>
                              SumHelper.showFundSumAccordingToIncome(
                                  controller),
                          color: AppColors.LIGHT_PINK,
                          title: 'Капитал',
                          onPress: () {
                            showDialog<Widget>(
                                context: context,
                                builder: (BuildContext context) {
                                  return FinancePopup(
                                    title: 'Капитал',
                                    backgroundColor: AppColors.LIGHT_PINK,
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        GetBuilder<FinanceController>(
                                          builder: (_) {
                                            return DropdownButton<String>(
                                              value: _showDropdownButtonValue(
                                                  controller),
                                              iconEnabledColor: Colors.white,
                                              iconSize: 24,
                                              elevation: 16,
                                              dropdownColor:
                                                  AppColors.LIGHT_PINK,
                                              style: const TextStyle(
                                                  color: Colors.white),
                                              underline: Container(
                                                height: 2,
                                                color: Colors.white,
                                              ),
                                              onChanged: (String? newValue) {
                                                controller.changeFundPercent(
                                                    newValue!);
                                              },
                                              items: <String>[
                                                '10%',
                                                '20%',
                                                '30%',
                                                '40%',
                                                '50%'
                                              ].map<DropdownMenuItem<String>>(
                                                  (String value) {
                                                return DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Text(value),
                                                );
                                              }).toList(),
                                            );
                                          },
                                        ),
                                        Text(
                                          'С каждого своего дохода и дохода семьи откладывай минимум 10% - это неприкосновенный запас, который нельзя тратить.',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1!
                                              .copyWith(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  );
                                });
                          },
                        ),
                        CardButton(
                          showSubtitle: () =>
                              SumHelper.showSumIncomeFromController(controller),
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
                          showSubtitle: () =>
                              SumHelper.showSumIncomeFromController(controller),
                          color: AppColors.LIGHT_PURPLE,
                          title: 'Платежи',
                          onPress: () {},
                        ),
                        CardButton(
                          showSubtitle: () =>
                              SumHelper.showExpensesSum(controller),
                          color: AppColors.LIGHT_BLUE,
                          title: 'Расходы',
                          onPress: () {
                            showDialog<Widget>(
                                context: context,
                                builder: (BuildContext context) {
                                  return FinancePopup(
                                    title: 'Расходы',
                                    backgroundColor: AppColors.LIGHT_BLUE,
                                    content: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          TextField(
                                            controller: FinanceController
                                                .to.housingController
                                              ..text = TextEditingControllerHelper
                                                  .showHousingExpensesToTextEditingController(
                                                      controller),
                                            autofocus: true,
                                            style: const TextStyle(
                                                color: Colors.white),
                                            keyboardType: TextInputType.number,
                                            decoration: const InputDecoration(
                                                labelText:
                                                    'Оплата за квартиру/дом',
                                                hintText: 'руб. / мес',
                                                hintStyle: TextStyle(
                                                    color: Colors.white),
                                                labelStyle: TextStyle(
                                                    color: Colors.white)),
                                            onChanged: (String text) =>
                                                OnTextChangedHelper
                                                    .onChangedHousingExpenses(
                                                        text, controller),
                                          ),
                                          TextField(
                                            controller: FinanceController
                                                .to.foodController
                                              ..text = TextEditingControllerHelper
                                                  .showFoodExpensesToTextEditingController(
                                                      controller),
                                            keyboardType: TextInputType.number,
                                            style: const TextStyle(
                                                color: Colors.white),
                                            decoration: const InputDecoration(
                                                labelText: 'На продукты',
                                                hintText: 'руб. / мес',
                                                hintStyle: TextStyle(
                                                    color: Colors.white),
                                                labelStyle: TextStyle(
                                                    color: Colors.white)),
                                            onChanged: (String text) =>
                                                OnTextChangedHelper
                                                    .onChangedFoodExpenses(
                                                        text, controller),
                                          ),
                                          TextField(
                                            controller: FinanceController
                                                .to.transportController
                                              ..text = TextEditingControllerHelper
                                                  .showTransportExpensesToTextEditingController(
                                                      controller),
                                            keyboardType: TextInputType.number,
                                            style: const TextStyle(
                                                color: Colors.white),
                                            decoration: const InputDecoration(
                                                labelText: 'Транспорт',
                                                hintText: 'руб. / мес',
                                                hintStyle: TextStyle(
                                                    color: Colors.white),
                                                labelStyle: TextStyle(
                                                    color: Colors.white)),
                                            onChanged: (String text) =>
                                                OnTextChangedHelper
                                                    .onChangedTransportExpenses(
                                                        text, controller),
                                          ),
                                          TextField(
                                            controller: FinanceController
                                                .to.foodOutController
                                              ..text = TextEditingControllerHelper
                                                  .showFoodOutExpensesToTextEditingController(
                                                      controller),
                                            keyboardType: TextInputType.number,
                                            style: const TextStyle(
                                                color: Colors.white),
                                            decoration: const InputDecoration(
                                                labelText: 'Еда вне дома',
                                                hintText: 'руб. / мес',
                                                hintStyle: TextStyle(
                                                    color: Colors.white),
                                                labelStyle: TextStyle(
                                                    color: Colors.white)),
                                            onChanged: (String text) =>
                                                OnTextChangedHelper
                                                    .onChangedFoodOutExpenses(
                                                        text, controller),
                                          ),
                                          TextField(
                                            controller: FinanceController
                                                .to.servicesController
                                              ..text = TextEditingControllerHelper
                                                  .showServicesExpensesToTextEditingController(
                                                      controller),
                                            keyboardType: TextInputType.number,
                                            style: const TextStyle(
                                                color: Colors.white),
                                            decoration: const InputDecoration(
                                                labelText: 'Услуги',
                                                hintText: 'руб. / мес',
                                                hintStyle: TextStyle(
                                                    color: Colors.white),
                                                labelStyle: TextStyle(
                                                    color: Colors.white)),
                                            onChanged: (String text) =>
                                                OnTextChangedHelper
                                                    .onChangedServicesExpenses(
                                                        text, controller),
                                          ),
                                          TextField(
                                            controller: FinanceController
                                                .to.entertainmentController
                                              ..text = TextEditingControllerHelper
                                                  .showEntertainmentExpensesToTextEditingController(
                                                      controller),
                                            keyboardType: TextInputType.number,
                                            style: const TextStyle(
                                                color: Colors.white),
                                            decoration: const InputDecoration(
                                                labelText: 'Развлечения',
                                                hintText: 'руб. / мес',
                                                hintStyle: TextStyle(
                                                    color: Colors.white),
                                                labelStyle: TextStyle(
                                                    color: Colors.white)),
                                            onChanged: (String text) =>
                                                OnTextChangedHelper
                                                    .onChangedEntertainmentExpenses(
                                                        text, controller),
                                          ),
                                          TextField(
                                            controller: FinanceController
                                                .to.additionalPaymentsController
                                              ..text = TextEditingControllerHelper
                                                  .showAdditionalPaymentsExpensesToTextEditingController(
                                                      controller),
                                            keyboardType: TextInputType.number,
                                            style: const TextStyle(
                                                color: Colors.white),
                                            decoration: const InputDecoration(
                                                labelText:
                                                    'Дополнительные платежи',
                                                hintText: 'руб. / мес',
                                                hintStyle: TextStyle(
                                                    color: Colors.white),
                                                labelStyle: TextStyle(
                                                    color: Colors.white)),
                                            onChanged: (String text) =>
                                                OnTextChangedHelper
                                                    .onChangedAdditionalPaymentsExpenses(
                                                        text, controller),
                                          ),
                                          TextField(
                                            controller: FinanceController
                                                .to.unexpectedExpensesController
                                              ..text = TextEditingControllerHelper
                                                  .showUnexpectedExpensesToTextEditingController(
                                                      controller),
                                            keyboardType: TextInputType.number,
                                            style: const TextStyle(
                                                color: Colors.white),
                                            decoration: const InputDecoration(
                                                labelText:
                                                    'Непредвиденные расходы',
                                                hintText: 'руб. / мес',
                                                hintStyle: TextStyle(
                                                    color: Colors.white),
                                                labelStyle: TextStyle(
                                                    color: Colors.white)),
                                            onChanged: (String text) =>
                                                OnTextChangedHelper
                                                    .onChangedUnexpectedExpenses(
                                                        text, controller),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          },
                        )
                      ],
                    )
                  ]);
                }))));
  }
}
