import 'package:hive/hive.dart';

import '../modules/finace/model/finance.dart';
import '../modules/finace/model/fund.dart';
import '../modules/finace/model/pocket.dart';
import '../repositories/finance_repository.dart';

class HiveFinanceService implements FinanceRepository {
  final Box<Finance> financeBox = Hive.box<Finance>('finance');

  @override
  Finance getFinanceFromStore() {
    if (financeBox.isNotEmpty) {
      var fromStore = financeBox.getAt(0);
      print(fromStore);
      if (fromStore != null) {
        return fromStore;
      } else {
        return Finance(fund: Fund(), pocketMoney: PocketMoney());
      }
    }
    return Finance(fund: Fund(), pocketMoney: PocketMoney());
  }

  @override
  Future<void> putFinance(Finance value) async {
    // var fromStore = financeBox.getAt(0);
    if (financeBox.isEmpty) {
      await financeBox.add(value);
    } else {
      await financeBox.putAt(0, value);
    }

    // finance.value = value;
  }
}
