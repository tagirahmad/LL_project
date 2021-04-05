// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aim_action.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AimActionAdapter extends TypeAdapter<AimAction> {
  @override
  final int typeId = 4;

  @override
  AimAction read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AimAction(
      action: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AimAction obj) {
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
      other is AimActionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
