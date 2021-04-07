import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:l_l_app/app/constants/finance_articles.dart';

import '../../../constants/colors.dart';
import '../../../constants/dimensions.dart';
import '../../../widgets/bank_card.dart';
import '../../../widgets/card_button.dart';
import '../../../widgets/finance_popup.dart';
import '../../../widgets/round_button.dart';
import '../controllers/finance_controller.dart';
import '../helpers/clear_controllers.dart';
import '../helpers/on_text_changed_helper.dart';
import '../helpers/sum_helper.dart';
import '../helpers/text_editing_controller_helper.dart';

class FinanceView extends GetView<FinanceController> {
  const FinanceView({Key? key}) : super(key: key);

  String _showFundDropdownButtonValue(FinanceController controller) {
    if (controller.finance.value!.fund != null &&
        controller.finance.value!.fund!.percents != null) {
      return '${controller.finance.value!.fund!.percents}%';
    } else {
      return '10%';
    }
  }

  String _showPocketDropdownButtonValue(FinanceController controller) {
    if (controller.finance.value!.pocketMoney != null &&
        controller.finance.value!.pocketMoney!.money != null) {
      return controller.finance.value!.pocketMoney!.money.toString();
    } else {
      return '500';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
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
                child: GetBuilder<FinanceController>(builder: (controller) {
                  return Column(children: <Widget>[
                    if (!controller.subscriptionStatus.value!)
                      Column(
                        children: const <Widget>[
                          Text(
                            // ignore: lines_longer_than_80_chars
                            'В бесплатной версии данные не сохраняются, а уведомления не приходят.',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                          SizedBox(
                            height: Dimensions.ITEM_INDENT,
                          ),
                        ],
                      )
                    else
                      const SizedBox(),
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
                                builder: (context) {
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
                                                // ignore: lines_longer_than_80_chars
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
                                          onChanged: (text) =>
                                              OnTextChangedHelper
                                                  .onChangedHusbandIncome(
                                                      text, controller),
                                        ),
                                        TextField(
                                          controller: FinanceController
                                              .to.wifeIncomeController
                                            ..text = TextEditingControllerHelper
                                                // ignore: lines_longer_than_80_chars
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
                                          onChanged: (text) =>
                                              OnTextChangedHelper
                                                  .onChangedWifeIncome(
                                                      text, controller),
                                        ),
                                        TextField(
                                          controller: FinanceController
                                              .to.additionalIncomeController
                                            ..text = TextEditingControllerHelper
                                                // ignore: lines_longer_than_80_chars
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
                                          onChanged: (text) =>
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
                              SumHelper.showSumOfDream(controller),
                          color: AppColors.LIGHT_YELLOW,
                          title: 'На мечту',
                          onPress: () {
                            showDialog<Widget>(
                                context: context,
                                builder: (context) {
                                  return FinancePopup(
                                      title: 'Капитал',
                                      backgroundColor: AppColors.LIGHT_PINK,
                                      content: Text(
                                        dreamArticle,
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1!
                                            .copyWith(color: Colors.white),
                                      ));
                                });
                          },
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
                                builder: (context) {
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
                                              value:
                                                  _showFundDropdownButtonValue(
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
                                              onChanged: (newValue) {
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
                                                  (value) {
                                                return DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Text(value),
                                                );
                                              }).toList(),
                                            );
                                          },
                                        ),
                                        Text(
                                          fundArticle,
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
                              _showPocketDropdownButtonValue(controller),
                          color: AppColors.CYAN,
                          title: 'На карман',
                          onPress: () {
                            showDialog<Widget>(
                                context: context,
                                builder: (context) {
                                  return FinancePopup(
                                    title: 'На карман',
                                    backgroundColor: AppColors.CYAN,
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        GetBuilder<FinanceController>(
                                          builder: (_) {
                                            return DropdownButton<String>(
                                              value:
                                                  _showPocketDropdownButtonValue(
                                                      controller),
                                              iconEnabledColor: Colors.white,
                                              iconSize: 24,
                                              elevation: 16,
                                              dropdownColor: AppColors.CYAN,
                                              style: const TextStyle(
                                                  color: Colors.white),
                                              underline: Container(
                                                height: 2,
                                                color: Colors.white,
                                              ),
                                              onChanged: (newValue) {
                                                controller.changePocketMoney(
                                                    newValue!);
                                              },
                                              items: <String>[
                                                '500',
                                                '1000',
                                                '2000',
                                                '5000'
                                              ].map<DropdownMenuItem<String>>(
                                                  (value) {
                                                return DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Text(value),
                                                );
                                              }).toList(),
                                            );
                                          },
                                        ),
                                        Text(
                                          pocketArticle,
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
                        )
                      ],
                    ),
                    const SizedBox(height: Dimensions.SIDE_INDENT),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        CardButton(
                          showSubtitle: () =>
                              SumHelper.showSumOfDebtPayments(controller),
                          color: AppColors.LIGHT_PURPLE,
                          title: 'Платежи',
                          onPress: () {
                            showDialog<Widget>(
                                context: context,
                                builder: (context) {
                                  return FinancePopup(
                                    title: 'Платежи',
                                    backgroundColor: AppColors.LIGHT_PURPLE,
                                    content: SingleChildScrollView(
                                      child: Text(paymentArticle,
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2!
                                              .copyWith(color: Colors.white)),
                                    ),
                                  );
                                });
                          },
                        ),
                        CardButton(
                          showSubtitle: () =>
                              SumHelper.showExpensesSum(controller),
                          color: AppColors.LIGHT_BLUE,
                          title: 'Расходы',
                          onPress: () {
                            showDialog<Widget>(
                                context: context,
                                builder: (context) {
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
                                            onChanged: (text) =>
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
                                            onChanged: (text) =>
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
                                            onChanged: (text) =>
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
                                            onChanged: (text) =>
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
                                            onChanged: (text) =>
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
                                            onChanged: (text) => OnTextChangedHelper
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
                                            onChanged: (text) => OnTextChangedHelper
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
                                            onChanged: (text) =>
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
                    ),
                    // Column(
                    //   children: [
                    //     ],
                    // ),
                    const SizedBox(
                      height: Dimensions.ITEM_INDENT,
                    ),
                    Text(
                      'Добавить банк/долг',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: Dimensions.ITEM_INDENT,
                    ),
                    if (controller.finance.value!.banks != null)
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.finance.value!.banks!.length,
                        itemBuilder: (context, index) {
                          return BankCard(
                            name: '${index + 1}. '
                                '${controller.finance.value!.banks![index].name}',
                            day: controller
                                .finance.value!.banks![index].paymentDate?.day
                                .toString(),
                            paymentAmount: controller.finance.value!
                                .banks![index].monthlyPaymentAmount
                                .toStringAsFixed(1),
                            onTap: () {
                              showDialog<Widget>(
                                      context: context,
                                      builder: (context) {
                                        return FinancePopup(
                                          backgroundColor:
                                              AppColors.LIGHT_PURPLE,
                                          title: '${index + 1}. '
                                              '${controller.finance.value!.banks![index].name}',
                                          actions: <Widget>[
                                            TextButton(
                                              style: ButtonStyle(
                                                  foregroundColor:
                                                      MaterialStateProperty.all<
                                                          Color>(Colors.red)),
                                              onPressed: () {
                                                controller
                                                    .removeBankFromStore(index);
                                                ClearTextEditingControllers
                                                    .clearBankTextEditingControllers(
                                                        controller);
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text('Удалить'),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              style: ButtonStyle(
                                                  overlayColor:
                                                      MaterialStateProperty
                                                          .all<Color>(AppColors
                                                              .LIGHT_BLUE)),
                                              child: const Text('ОК',
                                                  style: TextStyle(
                                                      color: Colors.white)),
                                            ),
                                          ],
                                          content: SingleChildScrollView(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                TextField(
                                                  controller: FinanceController
                                                      .to.bankName
                                                    ..text =
                                                        TextEditingControllerHelper
                                                            .showBankNameToTextEditingController(
                                                                controller,
                                                                index: index),
                                                  keyboardType:
                                                      TextInputType.text,
                                                  style: const TextStyle(
                                                      color: Colors.white),
                                                  autofocus: true,
                                                  decoration:
                                                      const InputDecoration(
                                                          labelText:
                                                              'Банк/долг',
                                                          hintText:
                                                              'Наименование',
                                                          hintStyle: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                          labelStyle: TextStyle(
                                                              color: Colors
                                                                  .white)),
                                                  onChanged: (text) =>
                                                      OnTextChangedHelper
                                                          .onChangedBankName(
                                                              text, controller,
                                                              index: index),
                                                ),
                                                TextField(
                                                  controller: FinanceController
                                                      .to.totalDebt
                                                    ..text =
                                                        TextEditingControllerHelper
                                                            .showTotalDebtToTextEditingController(
                                                                controller,
                                                                index: index),
                                                  keyboardType:
                                                      TextInputType.number,
                                                  style: const TextStyle(
                                                      color: Colors.white),
                                                  decoration: const InputDecoration(
                                                      labelText:
                                                          'Общая сумма задолжности',
                                                      hintText: 'руб',
                                                      hintStyle: TextStyle(
                                                          color: Colors.white),
                                                      labelStyle: TextStyle(
                                                          color: Colors.white)),
                                                  onChanged: (String text) =>
                                                      OnTextChangedHelper
                                                          .onChangedTotalDebt(
                                                              text, controller,
                                                              index: index),
                                                ),
                                                // TextField(
                                                //   controller: FinanceController
                                                //       .to.balanceLessPayments
                                                //     ..text =
                                                //         TextEditingControllerHelper
                                                //             .showBalanceLessPaymentsToTextEditingController(
                                                //                 controller,
                                                //                 index: index),
                                                //   keyboardType:
                                                //       TextInputType.number,
                                                //   style: const TextStyle(
                                                //       color: Colors.white),
                                                //   decoration: const InputDecoration(
                                                //       labelText:
                                                //           'Остаток за вычетом платежей',
                                                //       hintText: 'руб',
                                                //       hintStyle: TextStyle(
                                                //           color: Colors.white),
                                                //       labelStyle: TextStyle(
                                                //           color: Colors.white)),
                                                //   onChanged: (text) =>
                                                //       OnTextChangedHelper
                                                //           .onChangedBalanceLessPayments(
                                                //               text, controller,
                                                //               index: index),
                                                // ),
                                                TextField(
                                                  controller: FinanceController
                                                      .to.monthlyPaymentAmount
                                                    ..text =
                                                        TextEditingControllerHelper
                                                            .showMonthlyPaymentAmountToTextEditingController(
                                                                controller,
                                                                index: index),
                                                  keyboardType:
                                                      TextInputType.number,
                                                  style: const TextStyle(
                                                      color: Colors.white),
                                                  decoration: const InputDecoration(
                                                      labelText:
                                                          'Сумма ежемесячного платежа',
                                                      hintText: 'руб',
                                                      hintStyle: TextStyle(
                                                          color: Colors.white),
                                                      labelStyle: TextStyle(
                                                          color: Colors.white)),
                                                  onChanged: (text) =>
                                                      OnTextChangedHelper
                                                          .onChangedMonthlyPaymentAmount(
                                                              text, controller,
                                                              index: index),
                                                ),
                                                const SizedBox(
                                                  height:
                                                      Dimensions.ITEM_INDENT +
                                                          5,
                                                ),
                                                Text(
                                                  'Дата платежа',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .subtitle1!
                                                      .copyWith(
                                                          color: Colors.white),
                                                ),
                                                const SizedBox(
                                                  height:
                                                      Dimensions.ITEM_INDENT,
                                                ),
                                                ElevatedButton(
                                                    style: ButtonStyle(
                                                        backgroundColor:
                                                            MaterialStateProperty
                                                                .all<Color>(
                                                                    AppColors
                                                                        .LIGHT_BLUE)),
                                                    onPressed: () =>
                                                        _selectDate(
                                                            context, controller,
                                                            index: index),
                                                    child: GetBuilder<
                                                        FinanceController>(
                                                      initState: (_) {},
                                                      builder: (controller) {
                                                        return Text(
                                                            '${controller.finance.value!.banks![index].paymentDate?.day ?? 'День'}.${controller.finance.value!.banks![index].paymentDate?.month ?? 'месяц'}.${controller.finance.value!.banks![index].paymentDate?.year ?? 'год'}');
                                                      },
                                                    )),
                                                // '${controller.pickedDate.value?.day ?? 'День'}.${controller.pickedDate.value?.month ?? 'месяц'}.${controller.pickedDate.value?.year ?? 'год'}'))),
                                                const SizedBox(
                                                  height:
                                                      Dimensions.ITEM_INDENT,
                                                ),
                                                Text(
                                                  'Вам придет оповещение за 5 дней',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .subtitle2!
                                                      .copyWith(
                                                          color: Colors.white,
                                                          fontStyle:
                                                              FontStyle.italic),
                                                ),
                                                TextField(
                                                  controller: FinanceController
                                                      .to
                                                      .plusToMonthlyPaymentAmount
                                                    ..text =
                                                        TextEditingControllerHelper
                                                            .showPlusToMonthlyPaymentAmountToTextEditingController(
                                                                controller,
                                                                index: index),
                                                  keyboardType:
                                                      TextInputType.number,
                                                  style: const TextStyle(
                                                      color: Colors.white),
                                                  decoration: const InputDecoration(
                                                      labelText:
                                                          'Плюс к ежемесячному платежу',
                                                      hintText: 'руб',
                                                      hintStyle: TextStyle(
                                                          color: Colors.white),
                                                      labelStyle: TextStyle(
                                                          color: Colors.white)),
                                                  onChanged: (text) =>
                                                      OnTextChangedHelper
                                                          .onChangedPlusToMonthlyPaymentAmountt(
                                                              text, controller,
                                                              index: index),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      })
                                  .then((value) => ClearTextEditingControllers
                                      .clearBankTextEditingControllers(
                                          controller));
                            },
                          );
                        },
                      )
                    else
                      const SizedBox(),
                    RoundButton(
                        onPressed: () {
                          showDialog<Widget>(
                              context: context,
                              builder: (context) {
                                return FinancePopup(
                                  backgroundColor: AppColors.LIGHT_PURPLE,
                                  // title: '${index + 1}. '
                                  //     '${controller.finance.value!.banks![index].name}',
                                  title: 'Данные о банке/долге',
                                  content: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        TextField(
                                          controller:
                                              FinanceController.to.bankName,
                                          keyboardType: TextInputType.text,
                                          style: const TextStyle(
                                              color: Colors.white),
                                          autofocus: true,
                                          decoration: const InputDecoration(
                                              labelText: 'Банк/долг',
                                              hintText: 'Наименование',
                                              hintStyle: TextStyle(
                                                  color: Colors.white),
                                              labelStyle: TextStyle(
                                                  color: Colors.white)),
                                          // onChanged: (String text) =>
                                          //     OnTextChangedHelper
                                          //         .onChangedBankName(
                                          //             text, controller,
                                          //             index: index),
                                        ),
                                        TextField(
                                          controller:
                                              FinanceController.to.totalDebt,
                                          keyboardType: TextInputType.number,
                                          style: const TextStyle(
                                              color: Colors.white),
                                          decoration: const InputDecoration(
                                              labelText:
                                                  'Общая сумма задолжности',
                                              hintText: 'руб',
                                              hintStyle: TextStyle(
                                                  color: Colors.white),
                                              labelStyle: TextStyle(
                                                  color: Colors.white)),
                                          // onChanged: (String text) =>
                                          //     OnTextChangedHelper
                                          //         .onChangedTotalDebt(
                                          //             text, controller,
                                          //             index: index),
                                        ),
                                        // TextField(
                                        //   controller: FinanceController
                                        //       .to.balanceLessPayments,
                                        //   keyboardType: TextInputType.number,
                                        //   style: const TextStyle(
                                        //       color: Colors.white),
                                        //   decoration: const InputDecoration(
                                        //       labelText:
                                        //           'Остаток за вычетом платежей',
                                        //       hintText: 'руб',
                                        //       hintStyle: TextStyle(
                                        //           color: Colors.white),
                                        //       labelStyle: TextStyle(
                                        //           color: Colors.white)),
                                        //   // onChanged: (String text) =>
                                        //   //     OnTextChangedHelper
                                        //   //         .onChangedBalanceLessPayments(
                                        //   //             text, controller,
                                        //   //             index: index),
                                        // ),
                                        TextField(
                                          controller: FinanceController
                                              .to.monthlyPaymentAmount,
                                          keyboardType: TextInputType.number,
                                          style: const TextStyle(
                                              color: Colors.white),
                                          decoration: const InputDecoration(
                                              labelText:
                                                  'Сумма ежемесячного платежа',
                                              hintText: 'руб',
                                              hintStyle: TextStyle(
                                                  color: Colors.white),
                                              labelStyle: TextStyle(
                                                  color: Colors.white)),
                                          // onChanged: (String text) =>
                                          //     OnTextChangedHelper
                                          //         .onChangedMonthlyPaymentAmount(
                                          //             text, controller,
                                          //             index: index),
                                        ),
                                        const SizedBox(
                                          height: Dimensions.ITEM_INDENT + 5,
                                        ),
                                        Text(
                                          'Дата платежа',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1!
                                              .copyWith(color: Colors.white),
                                        ),
                                        const SizedBox(
                                          height: Dimensions.ITEM_INDENT,
                                        ),
                                        ElevatedButton(
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all<
                                                            Color>(
                                                        AppColors.LIGHT_BLUE)),
                                            onPressed: () => _selectDate(
                                                context, controller),
                                            child: Obx(() => Text(
                                                '${controller.pickedDate.value?.day ?? 'День'}.${controller.pickedDate.value?.month ?? 'месяц'}.${controller.pickedDate.value?.year ?? 'год'}'))),
                                        TextField(
                                          controller: FinanceController
                                              .to.plusToMonthlyPaymentAmount,
                                          keyboardType: TextInputType.number,
                                          style: const TextStyle(
                                              color: Colors.white),
                                          decoration: const InputDecoration(
                                              labelText:
                                                  'Плюс к ежемесячному платежу',
                                              hintText: 'руб',
                                              hintStyle: TextStyle(
                                                  color: Colors.white),
                                              labelStyle: TextStyle(
                                                  color: Colors.white)),
                                          // onChanged: (String text) =>
                                          //     OnTextChangedHelper
                                          //         .onChangedPlusToMonthlyPaymentAmountt(
                                          //             text, controller,
                                          //             index: index),
                                        ),
                                      ],
                                    ),
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        controller.saveBank(
                                            controller.bankName,
                                            controller.totalDebt,
                                            // controller.balanceLessPayments,
                                            controller.monthlyPaymentAmount,
                                            controller
                                                .plusToMonthlyPaymentAmount,
                                            controller.pickedDate.value!);

                                        ClearTextEditingControllers
                                            .clearBankTextEditingControllers(
                                                controller);
                                        Navigator.of(context).pop();
                                      },
                                      style: ButtonStyle(
                                          overlayColor:
                                              MaterialStateProperty.all<Color>(
                                                  AppColors.LIGHT_BLUE)),
                                      child: const Text('Сохранить',
                                          style:
                                              TextStyle(color: Colors.white)),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      style: ButtonStyle(
                                          overlayColor:
                                              MaterialStateProperty.all<Color>(
                                                  AppColors.LIGHT_BLUE)),
                                      child: const Text('Закрыть',
                                          style:
                                              TextStyle(color: Colors.white)),
                                    ),
                                  ],
                                );
                              }).then((value) {
                            ClearTextEditingControllers
                                .clearBankTextEditingControllers(controller);
                            controller.pickedDate.value = null;
                          });
                        },
                        iconPath: 'assets/images/plus.svg',
                        color: AppColors.LIGHT_PURPLE)
                  ]);
                }))));
  }

  Future<void> _selectDate(BuildContext context, FinanceController controller,
      {int? index}) async {
    DateTime _showInitialDate() {
      if (index != null) {
        return controller.finance.value!.banks?[index].paymentDate ??
            DateTime.now();
      } else {
        return controller.pickedDate.value ?? DateTime.now();
      }
    }

    var pickedDate = await showDatePicker(
        context: context,
        initialDate: _showInitialDate(),
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));

    if (pickedDate != null &&
        pickedDate != controller.pickedDate.value &&
        index != null) {
      controller.changePaymentDate(pickedDate, index: index);
      // controller.pickedDate.value = null;
    } else {
      controller.pickedDate.value = pickedDate;
    }
  }
}
