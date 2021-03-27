// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'action.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AimActionHiveAdapter extends TypeAdapter<AimActionHive> {
  @override
  final int typeId = 4;

  @override
  AimActionHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AimActionHive()..action = fields[0] as String;
  }

  @override
  void write(BinaryWriter writer, AimActionHive obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.action);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AimActionHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
