import 'package:hive/hive.dart';

part 'year_aim.g.dart';

@HiveType(typeId : 2)
class YearAimHive {
  @HiveField(0)
  late String aim;
}