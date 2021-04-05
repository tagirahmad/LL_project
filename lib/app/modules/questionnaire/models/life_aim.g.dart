// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'life_aim.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LifeAimAdapter extends TypeAdapter<LifeAim> {
  @override
  final int typeId = 2;

  @override
  LifeAim read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LifeAim(
      aim: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, LifeAim obj) {
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
      other is LifeAimAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
