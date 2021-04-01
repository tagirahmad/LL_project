import 'package:l_l_app/app/modules/finace/controllers/finance_controller.dart';

class TextEditingControllerHelper {
  static String showWifeIncomeToTextEditingController(
      FinanceController controller) {
    if (controller.finance.value!.income != null &&
        controller.finance.value!.income!.wifeIncome != null) {
      var sum = controller.finance.value!.income!.wifeIncome;
      if (sum != 0) {
        return sum.toString();
      } else {
        return '';
      }
    } else {
      return '';
    }
  }

  static String showHusbandIncomeToTextEditingController(
      FinanceController controller) {
    if (controller.finance.value!.income != null &&
        controller.finance.value!.income!.husbandIncome != null) {
      var sum = controller.finance.value!.income!.husbandIncome;
      if (sum != 0) {
        return sum.toString();
      } else {
        return '';
      }
    } else {
      return '';
    }
  }

  static String showAdditionalIncomeToTextEditingController(
      FinanceController controller) {
    if (controller.finance.value!.income != null &&
        controller.finance.value!.income!.additionalIncome != null) {
      var sum = controller.finance.value!.income!.additionalIncome;
      if (sum != 0) {
        return sum.toString();
      } else {
        return '';
      }
    } else {
      return '';
    }
  }

  static String showAdditionalPaymentsExpensesToTextEditingController(
      FinanceController controller) {
    if (controller.finance.value!.expenses != null &&
        controller.finance.value!.expenses!.additionalPayments != null) {
      var sum = controller.finance.value!.expenses!.additionalPayments;
      if (sum != 0) {
        return sum.toString();
      } else {
        return '';
      }
    } else {
      return '';
    }
  }

  static String showEntertainmentExpensesToTextEditingController(
      FinanceController controller) {
    if (controller.finance.value!.expenses != null &&
        controller.finance.value!.expenses!.entertainment != null) {
      var sum = controller.finance.value!.expenses!.entertainment;
      if (sum != 0) {
        return sum.toString();
      } else {
        return '';
      }
    } else {
      return '';
    }
  }

  static String showFoodExpensesToTextEditingController(
      FinanceController controller) {
    if (controller.finance.value!.income != null &&
        controller.finance.value!.income!.additionalIncome != null) {
      var sum = controller.finance.value!.income!.additionalIncome;
      if (sum != 0) {
        return sum.toString();
      } else {
        return '';
      }
    } else {
      return '';
    }
  }

  static String showFoodOutExpensesToTextEditingController(
      FinanceController controller) {
    if (controller.finance.value!.expenses != null &&
        controller.finance.value!.expenses!.foodOut != null) {
      var sum = controller.finance.value!.expenses!.foodOut;
      if (sum != 0) {
        return sum.toString();
      } else {
        return '';
      }
    } else {
      return '';
    }
  }

  static String showHousingExpensesToTextEditingController(
      FinanceController controller) {
    if (controller.finance.value!.expenses != null &&
        controller.finance.value!.expenses!.housing != null) {
      var sum = controller.finance.value!.expenses!.housing;
      if (sum != 0) {
        return controller.finance.value!.expenses!.housing.toString();
      } else {
        return '';
      }
    } else {
      return '';
    }
  }

  static String showServicesExpensesToTextEditingController(
      FinanceController controller) {
    if (controller.finance.value!.expenses != null &&
        controller.finance.value!.expenses!.services != null) {
      var sum = controller.finance.value!.expenses!.services;
      if (sum != 0) {
        return controller.finance.value!.expenses!.services.toString();
      } else {
        return '';
      }
    } else {
      return '';
    }
  }

  static String showTransportExpensesToTextEditingController(
      FinanceController controller) {
    if (controller.finance.value!.expenses != null &&
        controller.finance.value!.expenses!.transport != null) {
      var sum = controller.finance.value!.expenses!.transport;
      if (sum != 0) {
        return controller.finance.value!.expenses!.transport.toString();
      } else {
        return '';
      }
    } else {
      return '';
    }
  }

  static String showUnexpectedExpensesToTextEditingController(
      FinanceController controller) {
    if (controller.finance.value!.expenses != null &&
        controller.finance.value!.expenses!.unexpectedExpenses != null) {
      var sum = controller.finance.value!.expenses!.unexpectedExpenses;
      if (sum != 0) {
        return controller.finance.value!.expenses!.unexpectedExpenses
            .toString();
      } else {
        return '';
      }
    } else {
      return '';
    }
  }

  static String showBankNameToTextEditingController(
      FinanceController controller,
      {int? index}) {
    if (controller.finance.value!.banks != null &&
        index != null &&
        controller.finance.value!.banks![index].name != null) {
      var name = controller.finance.value!.banks![index].name;

      return name;
    } else {
      return '';
    }
  }

  static String showBalanceLessPaymentsToTextEditingController(
      FinanceController controller,
      {int? index}) {
    if (controller.finance.value!.banks != null &&
        index != null &&
        controller.finance.value!.banks![index].balanceLessPayments != null) {
      var balance = controller.finance.value!.banks![index].balanceLessPayments;

      if (balance != 0) {
        return balance.toString();
      } else {
        return '';
      }
    } else {
      return '';
    }
  }

  static String showTotalDebtToTextEditingController(
      FinanceController controller,
      {int? index}) {
    if (controller.finance.value!.banks != null &&
        index != null &&
        controller.finance.value!.banks![index].totalDebt != null) {
      var totalDebt = controller.finance.value!.banks![index].totalDebt;

      if (totalDebt != 0) {
        return totalDebt.toString();
      } else {
        return '';
      }
    } else {
      return '';
    }
  }

  static String showMonthlyPaymentAmountToTextEditingController(
      FinanceController controller,
      {int? index}) {
    if (controller.finance.value!.banks != null &&
        index != null &&
        controller.finance.value!.banks![index].monthlyPaymentAmount != null) {
      var monthlyPaymentAmount =
          controller.finance.value!.banks![index].monthlyPaymentAmount;

      if (monthlyPaymentAmount != 0) {
        return monthlyPaymentAmount.toString();
      } else {
        return '';
      }
    } else {
      return '';
    }
  }

  static String showPlusToMonthlyPaymentAmountToTextEditingController(
      FinanceController controller,
      {int? index}) {
    if (controller.finance.value!.banks != null &&
        index != null &&
        controller.finance.value!.banks![index].plusToMonthlyPaymentAmount !=
            null) {
      var plusToMonthlyPaymentAmount =
          controller.finance.value!.banks![index].plusToMonthlyPaymentAmount;

      if (plusToMonthlyPaymentAmount != 0) {
        return plusToMonthlyPaymentAmount.toString();
      } else {
        return '';
      }
    } else {
      return '';
    }
  }
}
