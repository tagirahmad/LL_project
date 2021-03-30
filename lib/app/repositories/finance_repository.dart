import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:l_l_app/app/modules/finace/model/finance.dart';
// import 'package:l_l_app/app/modules/finace/model/finance_hive.dart';
import 'package:l_l_app/app/modules/finace/model/income.dart';

abstract class FinanceRepository {
  // Future<void> putIncome(Income value, Rx<Finance> finance);
  // void getIncomeFromStore(Rx<Finance> finance);
  //
  // Future<void> putExpenses(String value, Rx<Finance> finance);
  // void getExpensesFromStore(Rx<Finance> finance);
  //
  // Future<void> putDream(String value, Rx<Finance> finance);
  // void getDreamFromStore(Rx<Finance> finance);
  //
  // Future<void> putFund(String value, Rx<Finance> finance);
  // void getFundFromStore(Rx<Finance> finance);

  Future<void> putFinance(Finance value);
  Finance? getFinanceFromStore();
}
