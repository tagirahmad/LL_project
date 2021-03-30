// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pocket.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PocketMoneyAdapter extends TypeAdapter<PocketMoney> {
  @override
  final int typeId = 9;

  @override
  PocketMoney read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PocketMoney(
      money: fields[0] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, PocketMoney obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.money);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PocketMoneyAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
