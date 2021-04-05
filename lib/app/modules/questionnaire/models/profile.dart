import 'package:hive/hive.dart';
import 'aim_action.dart';
import 'life_aim.dart';
import 'year_aim.dart';

part 'profile.g.dart';

@HiveType(typeId: 1)
class Profile {
  Profile(
      {this.name,
      this.age,
      this.city,
      List<LifeAim>? lifeAims,
      List<YearAim>? yearAims,
      List<AimAction>? aimActions,
      this.profileImagePath})
      : lifeAims = lifeAims ?? <LifeAim>[],
        yearAims = yearAims ?? <YearAim>[],
        aimActions = aimActions ?? <AimAction>[];
  @HiveField(0)
  String? name;
  @HiveField(1)
  int? age;
  @HiveField(2)
  String? city;
  @HiveField(3)
  String? profileImagePath;
  @HiveField(4)
  List<YearAim>? yearAims;
  @HiveField(5)
  List<LifeAim>? lifeAims;
  @HiveField(6)
  List<AimAction>? aimActions;
}
