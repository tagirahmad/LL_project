import 'package:l_l_app/app/modules/finace/controllers/finance_controller.dart';
import 'package:l_l_app/app/modules/finace/model/bank.dart';
import 'package:l_l_app/app/modules/finace/model/expenses.dart';
import 'package:l_l_app/app/modules/finace/model/income.dart';

class OnTextChangedHelper {
  static void onChangedHusbandIncome(
      String text, FinanceController controller) {
    var finance = controller.getFinance();

    finance.income ??= Income(husbandIncome: 0);
    finance.income!.husbandIncome = int.tryParse(text) ?? 0;

    FinanceController.to
        .setToFinance(FinanceController.to.hiveFinanceService, finance);
  }

  static void onChangedWifeIncome(String text, FinanceController controller) {
    var finance = controller.getFinance();

    finance.income ??= Income(wifeIncome: 0);
    finance.income!.wifeIncome = int.tryParse(text) ?? 0;

    FinanceController.to
        .setToFinance(FinanceController.to.hiveFinanceService, finance);
  }

  static void onChangedAdditionalIncome(
      String text, FinanceController controller) {
    var finance = controller.getFinance();

    finance.income ??= Income(additionalIncome: 0);
    finance.income!.additionalIncome = int.tryParse(text) ?? 0;

    FinanceController.to
        .setToFinance(FinanceController.to.hiveFinanceService, finance);
  }

  static void onChangedAdditionalPaymentsExpenses(
      String text, FinanceController controller) {
    var finance = controller.getFinance();

    finance.expenses ??= Expenses(additionalPayments: 0);
    finance.expenses!.additionalPayments = int.tryParse(text) ?? 0;

    FinanceController.to
        .setToFinance(FinanceController.to.hiveFinanceService, finance);
  }

  static void onChangedEntertainmentExpenses(
      String text, FinanceController controller) {
    var finance = controller.getFinance();

    finance.expenses ??= Expenses(entertainment: 0);
    finance.expenses!.entertainment = int.tryParse(text) ?? 0;

    FinanceController.to
        .setToFinance(FinanceController.to.hiveFinanceService, finance);
  }

  static void onChangedFoodExpenses(String text, FinanceController controller) {
    var finance = controller.getFinance();

    finance.expenses ??= Expenses(food: 0);
    finance.expenses!.food = int.tryParse(text) ?? 0;

    FinanceController.to
        .setToFinance(FinanceController.to.hiveFinanceService, finance);
  }

  static void onChangedFoodOutExpenses(
      String text, FinanceController controller) {
    var finance = controller.getFinance();

    finance.expenses ??= Expenses(foodOut: 0);
    finance.expenses!.foodOut = int.tryParse(text) ?? 0;

    FinanceController.to
        .setToFinance(FinanceController.to.hiveFinanceService, finance);
  }

  static void onChangedHousingExpenses(
      String text, FinanceController controller) {
    var finance = controller.getFinance();

    finance.expenses ??= Expenses(housing: 0);
    finance.expenses!.housing = int.tryParse(text) ?? 0;

    FinanceController.to
        .setToFinance(FinanceController.to.hiveFinanceService, finance);
  }

  static void onChangedServicesExpenses(
      String text, FinanceController controller) {
    var finance = controller.getFinance();

    finance.expenses ??= Expenses(services: 0);
    finance.expenses!.services = int.tryParse(text) ?? 0;

    FinanceController.to
        .setToFinance(FinanceController.to.hiveFinanceService, finance);
  }

  static void onChangedTransportExpenses(
      String text, FinanceController controller) {
    var finance = controller.getFinance();

    finance.expenses ??= Expenses(transport: 0);
    finance.expenses!.transport = int.tryParse(text) ?? 0;

    FinanceController.to
        .setToFinance(FinanceController.to.hiveFinanceService, finance);
  }

  static void onChangedUnexpectedExpenses(
      String text, FinanceController controller) {
    var finance = controller.getFinance();

    finance.expenses ??= Expenses(unexpectedExpenses: 0);
    finance.expenses!.unexpectedExpenses = int.tryParse(text) ?? 0;

    FinanceController.to
        .setToFinance(FinanceController.to.hiveFinanceService, finance);
  }

  static void onChangedBankName(String text, FinanceController controller,
      {int? index}) {
    var finance = controller.getFinance();

    finance.banks ??= <Bank>[Bank(name: text)];
    if (index != null) {
      finance.banks![index].name = text;
    }

    FinanceController.to
        .setToFinance(FinanceController.to.hiveFinanceService, finance);
  }

  static void onChangedBalanceLessPayments(
      String text, FinanceController controller,
      {int? index}) {
    var finance = controller.getFinance();

    var parsedText = double.tryParse(text) ?? 0;

    finance.banks ??= <Bank>[Bank(balanceLessPayments: parsedText)];
    if (index != null) {
      finance.banks![index].balanceLessPayments = parsedText;
    }

    FinanceController.to
        .setToFinance(FinanceController.to.hiveFinanceService, finance);
  }

  static void onChangedTotalDebt(String text, FinanceController controller,
      {int? index}) {
    var finance = controller.getFinance();

    var parsedText = double.tryParse(text) ?? 0;

    finance.banks ??= <Bank>[Bank(totalDebt: parsedText)];
    if (index != null) {
      finance.banks![index].totalDebt = parsedText;
    }

    FinanceController.to
        .setToFinance(FinanceController.to.hiveFinanceService, finance);
  }

  static void onChangedMonthlyPaymentAmount(
      String text, FinanceController controller,
      {int? index}) {
    var finance = controller.getFinance();

    var parsedText = double.tryParse(text) ?? 0;

    finance.banks ??= <Bank>[Bank(monthlyPaymentAmount: parsedText)];
    if (index != null) {
      finance.banks![index].monthlyPaymentAmount = parsedText;
    }

    FinanceController.to
        .setToFinance(FinanceController.to.hiveFinanceService, finance);
  }

  static void onChangedPlusToMonthlyPaymentAmountt(
      String text, FinanceController controller,
      {int? index}) {
    var finance = controller.getFinance();

    var parsedText = double.tryParse(text) ?? 0;

    finance.banks ??= <Bank>[Bank(plusToMonthlyPaymentAmount: parsedText)];
    if (index != null) {
      finance.banks![index].plusToMonthlyPaymentAmount = parsedText;
    }

    FinanceController.to
        .setToFinance(FinanceController.to.hiveFinanceService, finance);
  }
}
