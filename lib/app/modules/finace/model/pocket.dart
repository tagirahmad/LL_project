import 'package:hive/hive.dart';

part 'pocket.g.dart';

@HiveType(typeId: 9)
class PocketMoney {
  PocketMoney({this.money = 500});

  @HiveField(0)
  int? money;
}
