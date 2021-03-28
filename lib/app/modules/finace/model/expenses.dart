class Expenses {
  const Expenses(
      {this.additionalPayments = 0,
      this.entertainment = 0,
      this.food = 0,
      this.footOut = 0,
      this.housing = 0,
      this.services = 0,
      this.transport = 0,
      this.unexpectedExpenses = 0});

  final int? additionalPayments;
  final int? entertainment;
  final int? food;
  final int? footOut;
  final int? housing;
  final int? services;
  final int? transport;
  final int? unexpectedExpenses;

  int get sum =>
      additionalPayments! +
      entertainment! +
      food! +
      footOut! +
      housing! +
      services! +
      transport! +
      unexpectedExpenses!;
}
