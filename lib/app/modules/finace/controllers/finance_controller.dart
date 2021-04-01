import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:l_l_app/app/modules/finace/model/bank.dart';
import 'package:l_l_app/app/modules/finace/model/finance.dart';
import 'package:l_l_app/app/modules/finace/model/fund.dart';
import 'package:l_l_app/app/modules/finace/model/pocket.dart';
import 'package:l_l_app/app/services/hive_finance_service.dart';

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
  late TextEditingController balanceLessPayments;
  late TextEditingController monthlyPaymentAmount;
  late DateTime paymentDate;
  late TextEditingController plusToMonthlyPaymentAmount;

  Rx<DateTime> pickedDate = DateTime.now().obs;

  Rx<Finance> finance = Finance().obs;
  // Rx<Fund> fundPercent = Fund().obs;
  final HiveFinanceService hiveFinanceService = HiveFinanceService();

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
    balanceLessPayments = TextEditingController();
    monthlyPaymentAmount = TextEditingController();
    // paymentDate = TextEditingController();
    plusToMonthlyPaymentAmount = TextEditingController();
    // hiveFinanceService.financeBox.clear();
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
    balanceLessPayments.dispose();
    monthlyPaymentAmount.dispose();
    plusToMonthlyPaymentAmount.dispose();
    super.onClose();
  }

  void setToFinance(HiveFinanceService hiveFinanceService, Finance finance) {
    hiveFinanceService.putFinance(finance);
    this.finance.value = finance;
    update();
  }

  Finance getFinance() {
    var fromStore = hiveFinanceService.getFinanceFromStore();

    if (fromStore != null) {
      finance.value = fromStore;
      return fromStore;
    } else {
      finance.value = Finance();
      return Finance();
    }
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
      TextEditingController balanceLessPayments,
      TextEditingController monthlyPaymentAmount,
      TextEditingController plusToMonthlyPaymentAmount) {
    var finance = getFinance();

    // if (finance.banks != null) {

    // }
    finance.banks ??= <Bank>[Bank()];
    var banks = finance.banks!.toList();

    banks.add(Bank(
        name: bankName.text,
        balanceLessPayments: double.tryParse(balanceLessPayments.text) ?? 0,
        monthlyPaymentAmount: double.tryParse(monthlyPaymentAmount.text) ?? 0,
        plusToMonthlyPaymentAmount:
            double.tryParse(plusToMonthlyPaymentAmount.text) ?? 0,
        totalDebt: double.tryParse(totalDebt.text) ?? 0));
    finance.banks = banks;
    setToFinance(hiveFinanceService, finance);
  }

  void removeBankFromStore(int index) {
    var finance = getFinance();
    var banks = finance.banks!.toList();
    banks.removeAt(index);
    finance.banks = banks;
    setToFinance(hiveFinanceService, finance);
  }
}

// Bank(
//           name: bankName.text,
//           balanceLessPayments: double.tryParse(balanceLessPayments.text) ?? 0,
//           monthlyPaymentAmount: double.tryParse(monthlyPaymentAmount.text) ?? 0,
//           plusToMonthlyPaymentAmount:
//               double.tryParse(plusToMonthlyPaymentAmount.text) ?? 0,
//           totalDebt: double.tryParse(totalDebt.text) ?? 0)
