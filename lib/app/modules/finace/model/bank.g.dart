// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BankAdapter extends TypeAdapter<Bank> {
  @override
  final int typeId = 10;

  @override
  Bank read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Bank(
      name: fields[0] as String,
      balanceLessPayments: fields[2] as double,
      totalDebt: fields[1] as double,
      monthlyPaymentAmount: fields[3] as double,
      paymentDate: fields[4] as DateTime?,
      plusTomonthlyPaymentAmount: fields[5] as double,
    );
  }

  @override
  void write(BinaryWriter writer, Bank obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.totalDebt)
      ..writeByte(2)
      ..write(obj.balanceLessPayments)
      ..writeByte(3)
      ..write(obj.monthlyPaymentAmount)
      ..writeByte(4)
      ..write(obj.paymentDate)
      ..writeByte(5)
      ..write(obj.plusTomonthlyPaymentAmount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BankAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
