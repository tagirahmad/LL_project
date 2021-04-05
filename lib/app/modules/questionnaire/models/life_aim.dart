import 'package:hive/hive.dart';

import 'aim.dart';

part 'life_aim.g.dart';

@HiveType(typeId: 2)
class LifeAim extends Aim {
  LifeAim({required this.aim}) : super(aim: aim);

  @HiveField(0)
  @override
  final String aim;
}
