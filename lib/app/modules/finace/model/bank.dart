import 'package:hive/hive.dart';

part 'bank.g.dart';

@HiveType(typeId: 10)
class Bank {
  Bank(
      {this.name = '',
      this.balanceLessPayments = 0,
      this.totalDebt = 0,
      this.monthlyPaymentAmount = 0,
      this.paymentDate,
      this.plusToMonthlyPaymentAmount = 0});

  @HiveField(0)
  String name;
  @HiveField(1)
  double totalDebt;
  @HiveField(2)
  double balanceLessPayments; // Остаток за вычетом платежей
  @HiveField(3)
  double monthlyPaymentAmount;
  @HiveField(4)
  DateTime? paymentDate;
  @HiveField(5)
  double plusToMonthlyPaymentAmount;

  double get sum => monthlyPaymentAmount + plusToMonthlyPaymentAmount;
}
