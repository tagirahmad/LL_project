class Income {
  const Income(
      {this.additionalIncome = 0, this.husbandIncome = 0, this.wifeIncome = 0});

  final int? wifeIncome;
  final int? husbandIncome;
  final int? additionalIncome;

  int get sum => wifeIncome! + husbandIncome! + additionalIncome!;
}
