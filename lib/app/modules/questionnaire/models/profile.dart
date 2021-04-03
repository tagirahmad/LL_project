import 'aim.dart';

import 'aim_action.dart';

class Profile {
  Profile(
      {this.name,
      this.age,
      this.city,
      this.lifeAims,
      this.yearAims,
      this.aimActions,
      this.profileImagePath});

  String? profileImagePath;
  String? name;
  int? age;
  String? city;
  List<LifeAim>? lifeAims;
  List<YearAim>? yearAims;
  List<AimAction>? aimActions;
}
