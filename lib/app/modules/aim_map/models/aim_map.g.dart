// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aim_map.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AimMapAdapter extends TypeAdapter<AimMap> {
  @override
  final int typeId = 11;

  @override
  AimMap read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AimMap(
      moneyImg: fields[0] as String?,
      loveImg: fields[1] as String?,
      yourImg: fields[7] as String?,
      careerImg: fields[8] as String?,
      helpersImg: fields[5] as String?,
      homeImg: fields[2] as String?,
      kidsImg: fields[3] as String?,
      knowledgeImg: fields[4] as String?,
      notorietyImg: fields[6] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, AimMap obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.moneyImg)
      ..writeByte(1)
      ..write(obj.loveImg)
      ..writeByte(2)
      ..write(obj.homeImg)
      ..writeByte(3)
      ..write(obj.kidsImg)
      ..writeByte(4)
      ..write(obj.knowledgeImg)
      ..writeByte(5)
      ..write(obj.helpersImg)
      ..writeByte(6)
      ..write(obj.notorietyImg)
      ..writeByte(7)
      ..write(obj.yourImg)
      ..writeByte(8)
      ..write(obj.careerImg);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AimMapAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
