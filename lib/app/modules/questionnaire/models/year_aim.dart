import 'package:hive/hive.dart';

import 'aim.dart';

part 'year_aim.g.dart';

@HiveType(typeId: 3)
class YearAim extends Aim {
  YearAim({required this.aim}) : super(aim: aim);

  @HiveField(0)
  @override
  final String aim;
}
