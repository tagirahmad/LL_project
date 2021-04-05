// import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:hive/hive.dart';

// import '../modules/questionnaire/models/aim_action.dart';
// import '../modules/questionnaire/models/life_aim.dart';
import '../modules/questionnaire/models/profile.dart';
// import '../modules/questionnaire/models/year_aim.dart';
import '../repositories/profile_repository.dart';

class HiveProfileService implements ProfileRepository {
  // TextEditingController textEditingController = TextEditingController();
  final Box<Profile> profile = Hive.box<Profile>('profile');
  // final Box<dynamic> yearAims = Hive.box<dynamic>('yearAims');
  // final Box<dynamic> lifeAims = Hive.box<dynamic>('lifeAims');
  // final Box<dynamic> aimActions = Hive.box<dynamic>('aimActions');

  // @override
  // void getAgeFromStore(Rx<Profile> userProfile) {
  //   final dynamic ageFromStore = profile.get('age');
  //   if (ageFromStore != null) {
  //     userProfile.value!.age = ageFromStore as int;
  //   } else {
  //     userProfile.value!.age = null;
  //   }

  //   // ///
  //   // ///
  //   // ///
  //   // var lifeAims = ProfileHive()..lifeAims = <LifeAim>[LifeAim(aim: 'aim')];
  //   // var name = ProfileHive()..name = 'name';
  //   // profile1.put('lifeAims', lifeAims);
  //   // profile.put('key', <LifeAim>[LifeAim(aim: 'aim')]);
  // }

  // @override
  // void getCityFromStore(Rx<Profile> userProfile) {
  //   final dynamic cityFromStore = profile.get('city');
  //   if (cityFromStore != null) {
  //     userProfile.value!.city = cityFromStore.toString();
  //   }
  // }

  // @override
  // void getNameFromStore(Rx<Profile> userProfile) {
  //   final dynamic nameFromStore = profile.get('name');
  //   if (nameFromStore != null) {
  //     userProfile.value!.name = nameFromStore.toString();
  //   }
  // }

  // @override
  // Future<void> putAge(String age, Rx<Profile> userProfile) async {
  //   if (age == '') {
  //     await profile.put('age', null);
  //     userProfile.value!.age = null;
  //     textEditingController.clear();
  //   } else {
  //     await profile.put('age', int.parse(age));
  //     userProfile.value!.age = int.parse(age);
  //     textEditingController.clear();
  //   }
  // }

  // @override
  // Future<void> putCity(String city, Rx<Profile> userProfile) async {
  //   await profile.put('city', city);
  //   userProfile.value!.city = city;
  //   textEditingController.clear();
  // }

  // @override
  // Future<void> putName(String name, Rx<Profile> userProfile) async {
  //   await profile.put('name', name);
  //   userProfile.value!.name = name;
  //   textEditingController.clear();
  // }

  // @override
  // void getImageFromStore(Rx<Profile> userProfile) {
  //   final dynamic imageStorePath = profile.get('image');
  //   if (imageStorePath != null) {
  //     userProfile.value!.profileImagePath = imageStorePath.toString();
  //   }
  // }

  // @override
  // Future<void> putImagePath(String path, Rx<Profile> userProfile) async {
  //   await profile.put('image', path);
  //   if (path != null) {
  //     userProfile.value!.profileImagePath = path;
  //   }
  // }

  // @override
  // void getYearAimsFromStore(Rx<Profile> userProfile) {
  //   var el = yearAims.values;
  //   var elements = <YearAim>[];
  //   for (var item in el) {
  //     elements.add(YearAim(aim: item.aim.toString()));
  //   }
  //   userProfile.value!.yearAims = elements;
  // }

  // @override
  // Future<void> putYearAim(String yearAim, Rx<Profile> userProfile) async {
  //   var yearAimInst = YearAimHive()..aim = yearAim;
  //   await yearAims.add(yearAimInst);
  //   userProfile.value!.yearAims!.add(YearAim(aim: yearAim));
  // }

  // @override
  // void removeYearAimFromStore(Rx<Profile> userProfile, int index) {
  //   yearAims.deleteAt(index);
  //   userProfile.value!.yearAims!.removeAt(index);
  // }

  // @override
  // Future<void> updateYearAim(
  //     String yearAim, Rx<Profile> userProfile, int index) async {
  //   var yearAimInst = YearAimHive()..aim = yearAim;
  //   await yearAims.putAt(index, yearAimInst);
  //   userProfile.value!.yearAims![index] = YearAim(aim: yearAim);
  //   // userProfile.value!.yearAims!.insert(index, YearAim(aim: yearAim));
  //   // var yearAimInst1 = ProfileHive()
  //   //   ..yearAims.insert(index, YearAim(aim: yearAim));
  // }

  // @override
  // void getLifeAimsFromStore(Rx<Profile> userProfile) {
  //   var el = lifeAims.values;
  //   var elements = <LifeAim>[];
  //   for (var item in el) {
  //     elements.add(LifeAim(aim: item.aim.toString()));
  //   }
  //   userProfile.value!.lifeAims = elements;
  // }

  // @override
  // Future<void> putLifeAim(String lifeAim, Rx<Profile> userProfile) async {
  //   var lifeAimInst = LifeAimHive()..aim = lifeAim;
  //   await lifeAims.add(lifeAimInst);
  //   userProfile.value!.lifeAims!.add(LifeAim(aim: lifeAim));
  // }

  // @override
  // void removeLifeAimFromStore(Rx<Profile> userProfile, int index) {
  //   lifeAims.deleteAt(index);
  //   userProfile.value!.lifeAims!.removeAt(index);
  // }

  // @override
  // Future<void> updateLifeAim(
  //     String lifeAim, Rx<Profile> userProfile, int index) async {
  //   var lifeAimInst = YearAimHive()..aim = lifeAim;
  //   await lifeAims.putAt(index, lifeAimInst);
  //   userProfile.value!.lifeAims![index] = LifeAim(aim: lifeAim);
  // }

  // @override
  // void getAimActionsFromStore(Rx<Profile> userProfile) {
  //   var el = aimActions.values;
  //   var elements = <AimAction>[];
  //   for (var item in el) {
  //     elements.add(AimAction(action: item.action.toString()));
  //   }
  //   userProfile.value!.aimActions = elements;
  // }

  // @override
  // Future<void> putAimAction(String aimAction, Rx<Profile> userProfile) async {
  //   var aimActionInst = AimActionHive()..action = aimAction;
  //   await aimActions.add(aimActionInst);
  //   userProfile.value!.aimActions!.add(AimAction(action: aimAction));
  // }

  // @override
  // void removeAimActionFromStore(Rx<Profile> userProfile, int index) {
  //   aimActions.deleteAt(index);
  //   userProfile.value!.aimActions!.removeAt(index);
  // }

  // @override
  // Future<void> updateAimAction(
  //     String aimAction, Rx<Profile> userProfile, int index) async {
  //   var aimActionInst = AimActionHive()..action = aimAction;
  //   await aimActions.putAt(index, aimActionInst);
  //   userProfile.value!.aimActions![index] = AimAction(action: aimAction);
  // }

  @override
  Profile getProfileFromStore() {
    if (profile.isNotEmpty) {
      var fromStore = profile.getAt(0);
      if (fromStore != null) {
        return fromStore;
      } else {
        return Profile();
      }
    }
    return Profile();
  }

  @override
  Future<void> putProfile(Profile value) async {
    if (profile.isEmpty) {
      await profile.add(value);
    } else {
      await profile.putAt(0, value);
    }
  }
}
