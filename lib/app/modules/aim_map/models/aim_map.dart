import 'package:hive/hive.dart';

part 'aim_map.g.dart';

enum AimMapImg {
  moneyImg,
  loveImg,
  yourImg,
  careerImg,
  helpersImg,
  homeImg,
  kidsImg,
  knowledgeImg,
  notorietyImg,
}

@HiveType(typeId: 11)
class AimMap {
  AimMap({
    this.moneyImg,
    this.loveImg,
    this.yourImg,
    this.careerImg,
    this.helpersImg,
    this.homeImg,
    this.kidsImg,
    this.knowledgeImg,
    this.notorietyImg,
  });

  @HiveField(0)
  String? moneyImg;
  @HiveField(1)
  String? loveImg;
  @HiveField(2)
  String? homeImg;
  @HiveField(3)
  String? kidsImg;
  @HiveField(4)
  String? knowledgeImg;
  @HiveField(5)
  String? helpersImg;
  @HiveField(6)
  String? notorietyImg;
  @HiveField(7)
  String? yourImg;
  @HiveField(8)
  String? careerImg;

  AimMap copyWith({
    String? moneyImg,
    String? loveImg,
    String? homeImg,
    String? kidsImg,
    String? knowledgeImg,
    String? helpersImg,
    String? notorietyImg,
    String? yourImg,
    String? careerImg,
  }) {
    return AimMap(
      moneyImg: moneyImg ?? this.moneyImg,
      loveImg: loveImg ?? this.loveImg,
      homeImg: homeImg ?? this.homeImg,
      kidsImg: kidsImg ?? this.kidsImg,
      knowledgeImg: knowledgeImg ?? this.knowledgeImg,
      helpersImg: helpersImg ?? this.helpersImg,
      notorietyImg: notorietyImg ?? this.notorietyImg,
      yourImg: yourImg ?? this.yourImg,
      careerImg: careerImg ?? this.careerImg,
    );
  }
}
