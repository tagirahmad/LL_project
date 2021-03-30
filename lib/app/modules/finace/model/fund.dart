import 'package:hive/hive.dart';

part 'fund.g.dart';

@HiveType(typeId: 7)
class Fund {
  Fund({this.percents = 10});

  @HiveField(0)
  int? percents;
}
