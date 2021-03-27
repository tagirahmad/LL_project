import 'package:hive/hive.dart';

part 'life_aim.g.dart';

@HiveType(typeId : 3)
class LifeAimHive {
  @HiveField(0)
  late String aim;
}