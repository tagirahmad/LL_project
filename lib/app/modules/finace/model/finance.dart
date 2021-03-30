import 'package:hive/hive.dart';

import 'dream.dart';
import 'expenses.dart';
import 'fund.dart';
import 'income.dart';

part 'finance.g.dart';

@HiveType(typeId: 5)
class Finance {
  Finance({this.dream, this.income, this.expenses, this.fund});

  @HiveField(0)
  Income? income;
  @HiveField(1)
  Expenses? expenses;
  @HiveField(2)
  Dream? dream;
  @HiveField(3)
  Fund? fund;

  // set income(Income? income) => this.income = income;
}
