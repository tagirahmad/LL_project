// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'year_aim.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class YearAimAdapter extends TypeAdapter<YearAim> {
  @override
  final int typeId = 3;

  @override
  YearAim read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return YearAim(
      aim: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, YearAim obj) {
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
      other is YearAimAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
