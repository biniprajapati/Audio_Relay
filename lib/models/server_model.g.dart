// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ServerAdapter extends TypeAdapter<Server> {
  @override
  final int typeId = 0;

  @override
  Server read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Server(
      server_name: fields[0] as String,
      ip_address: fields[1] as String,
      buffer: fields[3] as int,
      max: fields[4] as double,
      average: fields[5] as double,
    );
  }

  @override
  void write(BinaryWriter writer, Server obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.server_name)
      ..writeByte(1)
      ..write(obj.ip_address)
      ..writeByte(3)
      ..write(obj.buffer)
      ..writeByte(4)
      ..write(obj.max)
      ..writeByte(5)
      ..write(obj.average);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ServerAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
