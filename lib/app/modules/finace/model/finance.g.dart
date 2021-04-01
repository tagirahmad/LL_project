// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'finance.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FinanceAdapter extends TypeAdapter<Finance> {
  @override
  final int typeId = 5;

  @override
  Finance read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Finance(
      dream: fields[2] as Dream?,
      income: fields[0] as Income?,
      expenses: fields[1] as Expenses?,
      fund: fields[3] as Fund?,
      banks: (fields[5] as List?)?.cast<Bank>(),
    )..pocketMoney = fields[4] as PocketMoney?;
  }

  @override
  void write(BinaryWriter writer, Finance obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.income)
      ..writeByte(1)
      ..write(obj.expenses)
      ..writeByte(2)
      ..write(obj.dream)
      ..writeByte(3)
      ..write(obj.fund)
      ..writeByte(4)
      ..write(obj.pocketMoney)
      ..writeByte(5)
      ..write(obj.banks);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FinanceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
