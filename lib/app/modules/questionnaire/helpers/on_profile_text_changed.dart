import '../controllers/profile_controller.dart';
import '../models/aim_action.dart';
import '../models/life_aim.dart';
import '../models/year_aim.dart';

class OnProfileTextChangedHelper {
  static void onChangedName(String text, ProfileController controller) {
    var profile = controller.getProfile();

    profile.name ??= '';
    profile.name = text;

    controller.setToProfile(controller.hiveProfileService, profile);
  }

  static void onChangedAge(String text, ProfileController controller) {
    var profile = controller.getProfile();

    // profile.age ??= null;
    profile.age = int.tryParse(text);

    controller.setToProfile(controller.hiveProfileService, profile);
  }

  static void onChangedCity(String text, ProfileController controller) {
    var profile = controller.getProfile();

    profile.city ??= '';
    profile.city = text;

    controller.setToProfile(controller.hiveProfileService, profile);
  }

  static void onChangedYearAim(
      String text, ProfileController controller, int index) {
    var profile = controller.getProfile();

    // profile.yearAims?[index] ??= '';
    profile.yearAims?[index] = YearAim(aim: text);

    controller.setToProfile(controller.hiveProfileService, profile);
  }

  static void onChangedLifeAim(
      String text, ProfileController controller, int index) {
    var profile = controller.getProfile();

    profile.lifeAims?[index] = LifeAim(aim: text);

    controller.setToProfile(controller.hiveProfileService, profile);
  }

  static void onChangedAimAction(
      String text, ProfileController controller, int index) {
    var profile = controller.getProfile();

    profile.aimActions?[index] = AimAction(action: text);

    controller.setToProfile(controller.hiveProfileService, profile);
  }
}
