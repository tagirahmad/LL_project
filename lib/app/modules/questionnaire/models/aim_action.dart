import 'package:hive/hive.dart';

part 'aim_action.g.dart';

@HiveType(typeId: 4)
class AimAction {
  const AimAction({required this.action});

  @HiveField(0)
  final String action;
}
