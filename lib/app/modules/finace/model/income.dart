import 'package:hive/hive.dart';

part 'income.g.dart';

@HiveType(typeId: 6)
class Income {
  Income(
      {this.additionalIncome = 0, this.husbandIncome = 0, this.wifeIncome = 0});

  @HiveField(0)
  int? wifeIncome;
  @HiveField(1)
  int? husbandIncome;
  @HiveField(2)
  int? additionalIncome;

  int get sum => wifeIncome! + husbandIncome! + additionalIncome!;
}
