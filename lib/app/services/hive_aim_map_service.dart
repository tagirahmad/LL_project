import 'package:hive/hive.dart';

import '../modules/aim_map/models/aim_map.dart';
import '../repositories/aim_map_repository.dart';

class HiveAimMapService implements AimMapRepository {
  final Box<AimMap> aimMapBox = Hive.box<AimMap>('aimMap');

  @override
  Future<void> putAimMap(AimMap value) async {
    if (aimMapBox.isEmpty) {
      await aimMapBox.add(value);
    } else {
      await aimMapBox.putAt(0, value);
    }
  }

  @override
  AimMap getAimMapFromStore() {
    if (aimMapBox.isNotEmpty) {
      var fromStore = aimMapBox.getAt(0);
      print(fromStore);
      if (fromStore != null) {
        print("getAimMapFromStore ${fromStore.moneyImg}");
        return fromStore;
      } else {
        return AimMap();
      }
    }
    return AimMap();
  }
}
