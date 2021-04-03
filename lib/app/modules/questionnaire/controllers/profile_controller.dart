import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../services/hive_profile_service.dart';

import '../models/profile.dart';

class ProfileController extends GetxController {
  static ProfileController get to => Get.find();

  final ImagePicker picker = ImagePicker();
  final Rx<Profile> userProfile = Profile().obs;
  final HiveProfileService hiveProfileService = HiveProfileService();

  Future<void> pickImage() async {
    // ignore: omit_local_variable_types
    final PickedFile? pickedFile =
        await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      userProfile.value!.profileImagePath = pickedFile.path;
      await hiveProfileService.putImagePath(pickedFile.path, userProfile);
      await hiveProfileService.profile.put('image', pickedFile.path);
    } else {
      print('No image selected.');
    }
  }

  @override
  void onInit() {
    hiveProfileService.getImageFromStore(userProfile);
    hiveProfileService.getNameFromStore(userProfile);
    hiveProfileService.getAgeFromStore(userProfile);
    hiveProfileService.getCityFromStore(userProfile);
    hiveProfileService.getYearAimsFromStore(userProfile);
    hiveProfileService.getLifeAimsFromStore(userProfile);
    hiveProfileService.getAimActionsFromStore(userProfile);
    // hiveProfileService.profile.clear();
    // hiveProfileService.yearAims.clear();
    // hiveProfileService.lifeAims.clear();
    super.onInit();
  }

  @override
  void onClose() {
    hiveProfileService.textEditingController.dispose();
    super.onClose();
  }
}
