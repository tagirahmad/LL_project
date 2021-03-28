class Income {
  Income(
      {this.additionalIncome = 0, this.husbandIncome = 0, this.wifeIncome = 0});

  late final int? wifeIncome;
  late final int? husbandIncome;
  late final int? additionalIncome;

  int get sum => wifeIncome! + husbandIncome! + additionalIncome!;
}
