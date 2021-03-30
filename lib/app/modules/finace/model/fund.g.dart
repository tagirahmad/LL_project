// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fund.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FundAdapter extends TypeAdapter<Fund> {
  @override
  final int typeId = 7;

  @override
  Fund read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Fund(
      percents: fields[0] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Fund obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.percents);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FundAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
