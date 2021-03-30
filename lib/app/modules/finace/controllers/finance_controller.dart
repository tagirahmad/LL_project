import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:l_l_app/app/modules/finace/model/finance.dart';
import 'package:l_l_app/app/modules/finace/model/fund.dart';
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

  Rx<Finance> finance = Finance().obs;
  // Rx<Fund> fundPercent = Fund().obs;
  final HiveFinanceService hiveFinanceService = HiveFinanceService();

  @override
  void onInit() {
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
    // hiveFinanceService.financeBox.clear();
    getFinance();
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
    this.finance.value!.fund = fund;

    var finance = getFinance();
    finance.fund = fund;

    setToFinance(hiveFinanceService, finance);
    update();
  }
}
