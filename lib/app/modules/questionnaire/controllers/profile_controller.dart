import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../services/hive_profile_service.dart';
import '../models/aim_action.dart';
import '../models/life_aim.dart';
import '../models/profile.dart';
import '../models/questionnaire_type.dart';
import '../models/year_aim.dart';

class ProfileController extends GetxController {
  static ProfileController get to => Get.find();
  TextEditingController textEditingController = TextEditingController();

  final ImagePicker picker = ImagePicker();
  final Rx<Profile> profile = Profile().obs;
  final HiveProfileService hiveProfileService = HiveProfileService();

  Future<void> pickImage() async {
    var pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      this.profile.value!.profileImagePath = pickedFile.path;
      var profile = getProfile();
      profile.profileImagePath = pickedFile.path;
      setToProfile(hiveProfileService, profile);
    } else {
      print('No image selected.');
    }
  }

  Profile getProfile() {
    var fromStore = hiveProfileService.getProfileFromStore();

    profile.value = fromStore;
    return fromStore;
  }

  void setToProfile(HiveProfileService hiveProfileService, Profile profile) {
    hiveProfileService.putProfile(profile);
    this.profile.value = profile;

    update();
  }

  void saveItemToStore(String text, QuestionnaireType questionnaireType) {
    var profile = getProfile();

    switch (questionnaireType) {
      case QuestionnaireType.lifeAim:
        var lifeAims = List<LifeAim>.from(profile.lifeAims!);

        lifeAims.add(LifeAim(aim: text));
        profile.lifeAims = lifeAims;
        setToProfile(hiveProfileService, profile);
        break;
      case QuestionnaireType.yearAim:
        var yearAims = List<YearAim>.from(profile.yearAims!);

        yearAims.add(YearAim(aim: text));
        profile.yearAims = yearAims;
        setToProfile(hiveProfileService, profile);
        break;
      case QuestionnaireType.actions:
        var aimActions = List<AimAction>.from(profile.aimActions!);

        aimActions.add(AimAction(action: text));
        profile.aimActions = aimActions;
        setToProfile(hiveProfileService, profile);
        break;
      default:
        return;
    }
  }

  void removeItemFromStore(int index, QuestionnaireType questionnaireType) {
    var profile = getProfile();
    switch (questionnaireType) {
      case QuestionnaireType.lifeAim:
        profile.lifeAims?.removeAt(index);
        setToProfile(hiveProfileService, profile);
        break;
      case QuestionnaireType.yearAim:
        profile.yearAims?.removeAt(index);
        setToProfile(hiveProfileService, profile);
        break;
      case QuestionnaireType.actions:
        profile.aimActions?.removeAt(index);
        setToProfile(hiveProfileService, profile);
        break;
      default:
        return;
    }
  }

  @override
  void onInit() {
    getProfile();
    // hiveProfileService.profile.clear();
    super.onInit();
  }

  @override
  void onClose() {
    textEditingController.dispose();
    super.onClose();
  }
}
