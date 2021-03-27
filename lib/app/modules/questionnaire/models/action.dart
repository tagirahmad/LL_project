import 'package:hive/hive.dart';

part 'action.g.dart';

@HiveType(typeId : 4)
class AimActionHive {
  @HiveField(0)
  late String action;
}