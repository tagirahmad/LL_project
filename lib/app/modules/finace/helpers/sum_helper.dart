import 'package:l_l_app/app/modules/finace/controllers/finance_controller.dart';
import 'package:l_l_app/app/modules/finace/model/bank.dart';

class SumHelper {
  static String showSumIncomeFromController(FinanceController controller) {
    if (controller.finance.value!.income != null) {
      var sum = controller.finance.value!.income!.sum;
      if (sum != 0) {
        return sum.toString();
      } else {
        return '';
      }
    } else {
      return '';
    }
  }

  static String showFundSumAccordingToIncome(FinanceController controller) {
    if (controller.finance.value!.income != null &&
        controller.finance.value!.fund?.percents != null) {
      var sum = controller.finance.value!.income!.sum *
          (controller.finance.value!.fund!.percents! / 100);
      if (sum != 0) {
        return sum.toStringAsFixed(1);
      } else {
        return '';
      }
    } else {
      return '';
    }
  }

  static String showExpensesSum(FinanceController controller) {
    if (controller.finance.value!.expenses != null) {
      var sum = controller.finance.value!.expenses!.sum;
      if (sum != 0) {
        return controller.finance.value!.expenses!.sum.toString();
      } else {
        return '';
      }
    } else {
      return '';
    }
  }

  static String showSumOfDebtPayments(FinanceController controller) {
    if (controller.finance.value!.banks != null) {
      var banks = controller.finance.value!.banks;
      var sumOfDebt = 0.0;

      for (var item in banks!) {
        sumOfDebt += item.sum;
      }

      if (sumOfDebt != 0.0) {
        return sumOfDebt.toString();
      } else {
        return '';
      }
    } else {
      return '';
    }
  }

  static String showSumOfDream(FinanceController controller) {
    var banks = controller.finance.value!.banks;
    var incomes = controller.finance.value!.income?.sum;
    double payments = 0.0;
    var expenses = controller.finance.value!.expenses?.sum;
    var pocketMoney = controller.finance.value!.pocketMoney?.money;
    var fund = double.tryParse(showFundSumAccordingToIncome(controller));

    for (var item in banks!) {
      payments += item.sum;
    }

    var sumOfDream = (incomes ?? 0) -
        (fund ?? 0) -
        payments -
        (expenses ?? 0) -
        (pocketMoney ?? 0);

    if (sumOfDream > 0) {
      return sumOfDream.toString();
    } else {
      return '';
    }
  }
}
