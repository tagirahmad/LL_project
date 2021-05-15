import 'package:l_l_app/app/modules/aim_map/models/aim_map.dart';

abstract class AimMapRepository {
  Future<void> putAimMap(AimMap aimMap);
  AimMap? getAimMapFromStore();
}
