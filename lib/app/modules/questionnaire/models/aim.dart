class Aim {
  Aim({required this.aim});
  final String aim;
}

class LifeAim extends Aim {
  LifeAim({required this.aim}) : super(aim: aim);

  @override
  final String aim;
}

class YearAim extends Aim {
  YearAim({required this.aim}) : super(aim: aim);

  final String aim;
}
