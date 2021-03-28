// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'finance_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FinanceHiveAdapter extends TypeAdapter<FinanceHive> {
  @override
  final int typeId = 5;

  @override
  FinanceHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FinanceHive(
      dream: fields[2] as Dream?,
      income: fields[0] as Income?,
      expenses: fields[1] as Expenses?,
      fund: fields[3] as Fund?,
    );
  }

  @override
  void write(BinaryWriter writer, FinanceHive obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.income)
      ..writeByte(1)
      ..write(obj.expenses)
      ..writeByte(2)
      ..write(obj.dream)
      ..writeByte(3)
      ..write(obj.fund);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FinanceHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
