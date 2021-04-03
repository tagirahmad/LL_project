import '../modules/finace/model/finance.dart';

abstract class FinanceRepository {
  Future<void> putFinance(Finance value);
  Finance? getFinanceFromStore();
}
