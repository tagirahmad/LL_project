import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/hive_finance_service.dart';
import '../../../services/local_notifications.dart';
import '../../../services/subscription_status.dart';
import '../model/bank.dart';
import '../model/finance.dart';
import '../model/fund.dart';
import '../model/pocket.dart';

class FinanceController extends GetxController {
  static FinanceController get to => Get.find();

  late TextEditingController husbandIncomeController;
  late TextEditingController wifeIncomeController;
  late TextEditingController additionalIncomeController;

  late TextEditingController additionalPaymentsController;
  late TextEditingController entertainmentController;
  late TextEditingController foodController;
  late TextEditingController foodOutController;
  late TextEditingController housingController;
  late TextEditingController servicesController;
  late TextEditingController transportController;
  late TextEditingController unexpectedExpensesController;

  late TextEditingController bankName;
  late TextEditingController totalDebt;
  // late TextEditingController balanceLessPayments;
  late TextEditingController monthlyPaymentAmount;
  late TextEditingController plusToMonthlyPaymentAmount;
  Rx<DateTime> pickedDate = DateTime.now().obs;

  Rx<Finance> finance = Finance().obs;
  final HiveFinanceService hiveFinanceService = HiveFinanceService();
  RxBool subscriptionStatus = false.obs;

  @override
  void onInit() {
    getFinance();
    husbandIncomeController = TextEditingController();
    wifeIncomeController = TextEditingController();
    additionalIncomeController = TextEditingController();
    additionalPaymentsController = TextEditingController();
    entertainmentController = TextEditingController();
    foodController = TextEditingController();
    foodOutController = TextEditingController();
    housingController = TextEditingController();
    servicesController = TextEditingController();
    transportController = TextEditingController();
    unexpectedExpensesController = TextEditingController();
    bankName = TextEditingController();
    totalDebt = TextEditingController();
    // balanceLessPayments = TextEditingController();
    monthlyPaymentAmount = TextEditingController();
    plusToMonthlyPaymentAmount = TextEditingController();
    // hiveFinanceService.financeBox.clear();
    subscriptionStatus.value = SubscriptionStatus.subscriptionStatus();
    super.onInit();
  }

  @override
  void onClose() {
    husbandIncomeController.dispose();
    wifeIncomeController.dispose();
    additionalIncomeController.dispose();
    additionalPaymentsController.dispose();
    entertainmentController.dispose();
    foodController.dispose();
    foodOutController.dispose();
    housingController.dispose();
    servicesController.dispose();
    transportController.dispose();
    unexpectedExpensesController.dispose();
    bankName.dispose();
    totalDebt.dispose();
    // balanceLessPayments.dispose();
    monthlyPaymentAmount.dispose();
    plusToMonthlyPaymentAmount.dispose();
    super.onClose();
  }

  void setToFinance(HiveFinanceService hiveFinanceService, Finance finance) {
    var isPurchased = SubscriptionStatus.subscriptionStatus();
    if (isPurchased) {
      hiveFinanceService.putFinance(finance);
      this.finance.value = finance;
    }

    update();
    // refresh();
  }

  Finance getFinance() {
    var fromStore = hiveFinanceService.getFinanceFromStore();

    // if (fromStore != null) {
    finance.value = fromStore;
    return fromStore;
    // } else {
    //   finance.value = Finance(fund: Fund(), pocketMoney: PocketMoney());
    //   return Finance(fund: Fund(), pocketMoney: PocketMoney());
    // }
  }

  void changeFundPercent(String value) {
    var parsedValue = int.parse(value.replaceAll(RegExp(r'.$'), ''));

    var fund = Fund(percents: parsedValue);
    // this.finance.value!.fund = fund;

    var finance = getFinance();
    finance.fund = fund;

    setToFinance(hiveFinanceService, finance);
    // update();
  }

  void changePocketMoney(String value) {
    var pocket = PocketMoney(money: int.parse(value));
    // this.finance.value!.pocketMoney = pocket;

    var finance = getFinance();
    finance.pocketMoney = pocket;

    setToFinance(hiveFinanceService, finance);
    // update();
  }

  void changePaymentDate(DateTime dateTime, {int? index}) {
    var finance = getFinance();

    if (index != null) {
      finance.banks![index].paymentDate = dateTime;
      // this.finance.value!.banks![index].paymentDate = dateTime;
    }

    setToFinance(hiveFinanceService, finance);
    // update();
  }

  void saveBank(
      TextEditingController bankName,
      TextEditingController totalDebt,
      // TextEditingController balanceLessPayments,
      TextEditingController monthlyPaymentAmount,
      TextEditingController plusToMonthlyPaymentAmount,
      DateTime paymentDate) {
    var finance = getFinance();

    // if (finance.banks != null) {

    // }
    finance.banks ??= <Bank>[Bank()];
    var banks = finance.banks!.toList();

    banks.add(Bank(
        name: bankName.text,
        // balanceLessPayments: double.tryParse(balanceLessPayments.text) ?? 0,
        monthlyPaymentAmount: double.tryParse(monthlyPaymentAmount.text) ?? 0,
        plusToMonthlyPaymentAmount:
            double.tryParse(plusToMonthlyPaymentAmount.text) ?? 0,
        totalDebt: double.tryParse(totalDebt.text) ?? 0,
        paymentDate: paymentDate));
    finance.banks = banks;
    setToFinance(hiveFinanceService, finance);
    if (subscriptionStatus.value! == true) {
      LocalNotifications()
          .showNotificationPeriodically(banks.length - 1,
              'Не забудьте оплатить долг/кредит!', paymentDate)
          .then((value) => value);
    }
  }

  void removeBankFromStore(int index) {
    var finance = getFinance();
    var banks = finance.banks!.toList();
    banks.removeAt(index);
    finance.banks = banks;
    setToFinance(hiveFinanceService, finance);
    if (subscriptionStatus.value! == true) {
      LocalNotifications().cancelNotification(index);
    }
  }
}
