import 'package:hive/hive.dart';

part 'expenses.g.dart';

@HiveType(typeId: 8)
class Expenses {
  Expenses(
      {this.additionalPayments = 0,
      this.entertainment = 0,
      this.food = 0,
      this.foodOut = 0,
      this.housing = 0,
      this.services = 0,
      this.transport = 0,
      this.unexpectedExpenses = 0});

  @HiveField(0)
  int? additionalPayments;
  @HiveField(1)
  int? entertainment;
  @HiveField(2)
  int? food;
  @HiveField(3)
  int? foodOut;
  @HiveField(4)
  int? housing;
  @HiveField(5)
  int? services;
  @HiveField(6)
  int? transport;
  @HiveField(7)
  int? unexpectedExpenses;

  int get sum =>
      additionalPayments! +
      entertainment! +
      food! +
      foodOut! +
      housing! +
      services! +
      transport! +
      unexpectedExpenses!;
}
