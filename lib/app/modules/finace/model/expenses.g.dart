// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expenses.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ExpensesAdapter extends TypeAdapter<Expenses> {
  @override
  final int typeId = 8;

  @override
  Expenses read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Expenses(
      additionalPayments: fields[0] as int?,
      entertainment: fields[1] as int?,
      food: fields[2] as int?,
      foodOut: fields[3] as int?,
      housing: fields[4] as int?,
      services: fields[5] as int?,
      transport: fields[6] as int?,
      unexpectedExpenses: fields[7] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Expenses obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.additionalPayments)
      ..writeByte(1)
      ..write(obj.entertainment)
      ..writeByte(2)
      ..write(obj.food)
      ..writeByte(3)
      ..write(obj.foodOut)
      ..writeByte(4)
      ..write(obj.housing)
      ..writeByte(5)
      ..write(obj.services)
      ..writeByte(6)
      ..write(obj.transport)
      ..writeByte(7)
      ..write(obj.unexpectedExpenses);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExpensesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
