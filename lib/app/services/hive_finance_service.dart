import 'package:hive/hive.dart';
import 'package:l_l_app/app/modules/finace/model/finance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:l_l_app/app/modules/finace/model/finance_hive.dart';
import 'package:l_l_app/app/repositories/finance_repository.dart';

class HiveFinanceService implements FinanceRepository {
  final Box<FinanceHive> financeBox = Hive.box<FinanceHive>('finance');

  // @override
  // void getDreamFromStore(Rx<Finance> finance) {
  //   final dynamic dream = financeBox.get('dream');
  //   if (dream != null) {
  //     finance.value!.dream!.sum = dream as int;
  //   } else {
  //     finance.value!.dream!.sum = null;
  //   }
  // }
  //
  // @override
  // void getExpensesFromStore(Rx<Finance> finance) {
  //   // StringODO: implement getExpensesFromStore
  // }
  //
  // @override
  // void getFundFromStore(Rx<Finance> finance) {
  //   // StringODO: implement getFundFromStore
  // }
  //
  // @override
  // void getIncomeFromStore(Rx<Finance> finance) {
  //   final dynamic additionalIncome = financeBox.get('additionalIncome');
  //   final dynamic husbandIncome = financeBox.get('husbandIncome');
  //   final dynamic wifeIncome = financeBox.get('wifeIncome');
  //
  //   if (additionalIncome != null) {
  //     finance.value!.income!.additionalIncome = additionalIncome as int;
  //   } else {
  //     finance.value!.income!.additionalIncome = null;
  //   }
  //
  //   if (husbandIncome != null) {
  //     finance.value!.income!.husbandIncome = husbandIncome as int;
  //   } else {
  //     finance.value!.income!.husbandIncome = null;
  //   }
  //
  //   if (wifeIncome != null) {
  //     finance.value!.income!.wifeIncome = wifeIncome as int;
  //   } else {
  //     finance.value!.income!.wifeIncome = null;
  //   }
  // }
  //
  // @override
  // Future<void> putDream(String value, Rx<Finance> finance) async {
  //   if (value == '') {
  //     await financeBox.put('dream', null);
  //     finance.value!.dream!.sum = null;
  //   } else {
  //     await financeBox.put('age', int.parse(value));
  //     finance.value!.dream!.sum = int.parse(value);
  //   }
  // }
  //
  // @override
  // Future<void> putExpenses(String value, Rx<Finance> finance) {
  //   // StringODO: implement putExpenses
  //   throw UnimplementedError();
  // }
  //
  // @override
  // Future<void> putFund(String value, Rx<Finance> finance) {
  //   // StringODO: implement putFund
  //   throw UnimplementedError();
  // }
  //
  // @override
  // Future<void> putIncome(Income value, Rx<Finance> finance) async {
  //   if (value.husbandIncome == '') {
  //     await financeBox.put('husbandIncome', null);
  //     finance.value!.income!.husbandIncome = null;
  //   } else {
  //     await financeBox.put('husbandIncome', value.husbandIncome);
  //     finance.value!.income!.husbandIncome = value.husbandIncome;
  //   }
  //
  //   if (value.husbandIncome == '') {
  //     await financeBox.put('husbandIncome', null);
  //     finance.value!.income!.husbandIncome = null;
  //   } else {
  //     await financeBox.put('husbandIncome', value.husbandIncome);
  //     finance.value!.income!.husbandIncome = value.husbandIncome;
  //   }
  // }

  @override
  void getFinanceFromStore(Rx<Finance> finance) {
    if (financeBox.isNotEmpty) {
      var fromStore = financeBox.getAt(0);
      print(fromStore);
      if (fromStore != null) {
        finance.value = Finance(
            dream: fromStore.dream,
            income: fromStore.income,
            expenses: fromStore.expenses,
            fund: fromStore.fund);
      } else {
        finance.value = null;
      }
    }
  }

  @override
  Future<void> putFinance(Finance value, Rx<Finance> finance) async {
    var fromStore = financeBox.getAt(0);
    
    await financeBox.putAt(
        0,
        FinanceHive(
            dream: value.dream,
            income: value.income,
            expenses: value.expenses,
            fund: value.fund));
    finance.value = value;
  }
}
