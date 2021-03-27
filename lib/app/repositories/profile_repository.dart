import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:l_l_app/app/modules/questionnaire/models/aim.dart';
import 'package:l_l_app/app/modules/questionnaire/models/profile.dart';

abstract class ProfileRepository {
  Future<void> putName(String name, Rx<Profile> userProfile);
  void getNameFromStore(Rx<Profile> userProfile);

  Future<void> putAge(String age, Rx<Profile> userProfile);
  void getAgeFromStore(Rx<Profile> userProfile);

  Future<void> putCity(String city, Rx<Profile> userProfile);
  void getCityFromStore(Rx<Profile> userProfile);

  Future<void> putImagePath(String path, Rx<Profile> userProfile);
  void getImageFromStore(Rx<Profile> userProfile);

  Future<void> putYearAim(String yearAim, Rx<Profile> userProfile);
  void getYearAimsFromStore(Rx<Profile> userProfile);
  void removeYearAimFromStore(Rx<Profile> userProfile, int index);
  Future<void> updateYearAim(
      String yearAim, Rx<Profile> userProfile, int index);

  Future<void> putLifeAim(String lifeAim, Rx<Profile> userProfile);
  void getLifeAimsFromStore(Rx<Profile> userProfile);
  void removeLifeAimFromStore(Rx<Profile> userProfile, int index);
  Future<void> updateLifeAim(
      String lifeAim, Rx<Profile> userProfile, int index);

  Future<void> putAimAction(String aimAction, Rx<Profile> userProfile);
  void getAimActionsFromStore(Rx<Profile> userProfile);
  void removeAimActionFromStore(Rx<Profile> userProfile, int index);
  Future<void> updateAimAction(String aimAction, Rx<Profile> userProfile, int index);
}
