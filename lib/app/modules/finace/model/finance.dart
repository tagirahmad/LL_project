import 'package:hive/hive.dart';

import 'bank.dart';
import 'dream.dart';
import 'expenses.dart';
import 'fund.dart';
import 'income.dart';
import 'pocket.dart';

part 'finance.g.dart';

@HiveType(typeId: 5)
class Finance {
  Finance(
      {this.dream,
      this.income,
      this.expenses,
      this.fund,
      List<Bank>? banks,
      this.pocketMoney})
      : banks = banks ?? <Bank>[Bank()];

  @HiveField(0)
  Income? income;
  @HiveField(1)
  Expenses? expenses;
  @HiveField(2)
  Dream? dream;
  @HiveField(3)
  Fund? fund;
  @HiveField(4)
  PocketMoney? pocketMoney;
  @HiveField(5)
  List<Bank>? banks;

  // set income(Income? income) => this.income = income;
}
