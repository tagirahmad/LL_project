// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProfileAdapter extends TypeAdapter<Profile> {
  @override
  final int typeId = 1;

  @override
  Profile read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Profile(
      name: fields[0] as String?,
      age: fields[1] as int?,
      city: fields[2] as String?,
      lifeAims: (fields[5] as List?)?.cast<LifeAim>(),
      yearAims: (fields[4] as List?)?.cast<YearAim>(),
      aimActions: (fields[6] as List?)?.cast<AimAction>(),
      profileImagePath: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Profile obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.age)
      ..writeByte(2)
      ..write(obj.city)
      ..writeByte(3)
      ..write(obj.profileImagePath)
      ..writeByte(4)
      ..write(obj.yearAims)
      ..writeByte(5)
      ..write(obj.lifeAims)
      ..writeByte(6)
      ..write(obj.aimActions);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProfileAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
