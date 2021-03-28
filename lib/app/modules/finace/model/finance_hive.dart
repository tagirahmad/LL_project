import 'package:hive/hive.dart';

import 'dream.dart';
import 'expenses.dart';
import 'fund.dart';
import 'income.dart';

part 'finance_hive.g.dart';

@HiveType(typeId: 5)
class FinanceHive {
  FinanceHive({this.dream, this.income, this.expenses, this.fund});

  @HiveField(0)
  final Income? income;
  @HiveField(1)
  final Expenses? expenses;
  @HiveField(2)
  final Dream? dream;
  @HiveField(3)
  final Fund? fund;
}
