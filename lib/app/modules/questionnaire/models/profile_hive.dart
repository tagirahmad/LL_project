import 'package:hive/hive.dart';
import 'package:l_l_app/app/modules/questionnaire/models/aim.dart';

part 'profile_hive.g.dart';

@HiveType(typeId : 1)
class ProfileHive {
  @HiveField(0)
  late String name;

  @HiveField(1)
  late int age;

  @HiveField(2)
  late String city;

  @HiveField(3)
  late String profileImagePath;

  @HiveField(4)
  late List<YearAim> yearAims;

  @HiveField(5)
  late List<LifeAim> lifeAims;
}
