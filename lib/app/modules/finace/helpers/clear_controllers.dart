import '../controllers/finance_controller.dart';

class ClearTextEditingControllers {
  static void clearBankTextEditingControllers(FinanceController controller) {
    controller.bankName.clear();
    controller.totalDebt.clear();
    controller.balanceLessPayments.clear();
    controller.monthlyPaymentAmount.clear();
    controller.plusToMonthlyPaymentAmount.clear();
  }
}
