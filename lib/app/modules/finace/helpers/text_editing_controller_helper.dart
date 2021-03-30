import 'package:l_l_app/app/modules/finace/controllers/finance_controller.dart';

class TextEditingControllerHelper {
  static String showWifeIncomeToTextEditingController(
      FinanceController controller) {
    if (controller.finance.value!.income != null &&
        controller.finance.value!.income!.wifeIncome != null) {
      return controller.finance.value!.income!.wifeIncome.toString();
    } else {
      return '';
    }
  }

  static String showHusbandIncomeToTextEditingController(
      FinanceController controller) {
    if (controller.finance.value!.income != null &&
        controller.finance.value!.income!.husbandIncome != null) {
      return controller.finance.value!.income!.husbandIncome.toString();
    } else {
      return '';
    }
  }

  static String showAdditionalIncomeToTextEditingController(
      FinanceController controller) {
    if (controller.finance.value!.income != null &&
        controller.finance.value!.income!.additionalIncome != null) {
      return controller.finance.value!.income!.additionalIncome.toString();
    } else {
      return '';
    }
  }

  static String showAdditionalPaymentsExpensesToTextEditingController(
      FinanceController controller) {
    if (controller.finance.value!.expenses != null &&
        controller.finance.value!.expenses!.additionalPayments != null) {
      return controller.finance.value!.expenses!.additionalPayments.toString();
    } else {
      return '';
    }
  }

  static String showEntertainmentExpensesToTextEditingController(
      FinanceController controller) {
    if (controller.finance.value!.expenses != null &&
        controller.finance.value!.expenses!.entertainment != null) {
      return controller.finance.value!.expenses!.entertainment.toString();
    } else {
      return '';
    }
  }

  static String showFoodExpensesToTextEditingController(
      FinanceController controller) {
    if (controller.finance.value!.income != null &&
        controller.finance.value!.income!.additionalIncome != null) {
      return controller.finance.value!.income!.additionalIncome.toString();
    } else {
      return '';
    }
  }

  static String showFoodOutExpensesToTextEditingController(
      FinanceController controller) {
    if (controller.finance.value!.expenses != null &&
        controller.finance.value!.expenses!.foodOut != null) {
      return controller.finance.value!.expenses!.foodOut.toString();
    } else {
      return '';
    }
  }

  static String showHousingExpensesToTextEditingController(
      FinanceController controller) {
    if (controller.finance.value!.expenses != null &&
        controller.finance.value!.expenses!.housing != null) {
      return controller.finance.value!.expenses!.housing.toString();
    } else {
      return '';
    }
  }

  static String showServicesExpensesToTextEditingController(
      FinanceController controller) {
    if (controller.finance.value!.expenses != null &&
        controller.finance.value!.expenses!.services != null) {
      return controller.finance.value!.expenses!.services.toString();
    } else {
      return '';
    }
  }

  static String showTransportExpensesToTextEditingController(
      FinanceController controller) {
    if (controller.finance.value!.expenses != null &&
        controller.finance.value!.expenses!.transport != null) {
      return controller.finance.value!.expenses!.transport.toString();
    } else {
      return '';
    }
  }

  static String showUnexpectedExpensesToTextEditingController(
      FinanceController controller) {
    if (controller.finance.value!.expenses != null &&
        controller.finance.value!.expenses!.unexpectedExpenses != null) {
      return controller.finance.value!.expenses!.unexpectedExpenses.toString();
    } else {
      return '';
    }
  }
}
