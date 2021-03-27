// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'year_aim.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class YearAimHiveAdapter extends TypeAdapter<YearAimHive> {
  @override
  final int typeId = 2;

  @override
  YearAimHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return YearAimHive()..aim = fields[0] as String;
  }

  @override
  void write(BinaryWriter writer, YearAimHive obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.aim);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is YearAimHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
