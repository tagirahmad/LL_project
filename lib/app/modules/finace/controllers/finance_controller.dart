import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:l_l_app/app/modules/finace/model/finance.dart';
import 'package:l_l_app/app/services/hive_finance_service.dart';

class FinanceController extends GetxController {
  static FinanceController get to => Get.find();
  late TextEditingController husbandIncomeController;
  late TextEditingController wifeIncomeController;

  final Rx<Finance> finance = Finance().obs;

  final HiveFinanceService hiveFinanceService = HiveFinanceService();
  @override
  void onInit() {
    husbandIncomeController = TextEditingController();
    wifeIncomeController = TextEditingController();
    hiveFinanceService.getFinanceFromStore(finance);
    super.onInit();
  }

  @override
  void onClose() {
    husbandIncomeController.dispose();
    wifeIncomeController.dispose();
    super.onClose();
  }
}
