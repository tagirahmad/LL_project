import 'package:l_l_app/app/modules/finace/controllers/finance_controller.dart';

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
      var sum = (controller.finance.value!.income!.sum *
          (controller.finance.value!.fund!.percents! / 100));
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
}
