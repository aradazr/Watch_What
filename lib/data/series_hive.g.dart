// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'series_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SeriesAdapter extends TypeAdapter<HiveSeries> {
  @override
  final int typeId = 0;

  @override
  HiveSeries read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveSeries(
      name: fields[0] as String,
      description: fields[1] as String,
      point: fields[2] as String,
      serialUrl: fields[3] as String,
      imagePath: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HiveSeries obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.point)
      ..writeByte(3)
      ..write(obj.serialUrl)
      ..writeByte(4)
      ..write(obj.imagePath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SeriesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
