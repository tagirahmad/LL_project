import 'dream.dart';
import 'expenses.dart';
import 'fund.dart';
import 'income.dart';

class Finance {
  Finance({this.dream, this.income, this.expenses, this.fund});

  final Income? income;
  final Expenses? expenses;
  final Dream? dream;
  final Fund? fund;
}
