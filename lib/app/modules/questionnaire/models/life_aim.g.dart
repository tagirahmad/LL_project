// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'life_aim.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LifeAimHiveAdapter extends TypeAdapter<LifeAimHive> {
  @override
  final int typeId = 3;

  @override
  LifeAimHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LifeAimHive()..aim = fields[0] as String;
  }

  @override
  void write(BinaryWriter writer, LifeAimHive obj) {
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
      other is LifeAimHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
