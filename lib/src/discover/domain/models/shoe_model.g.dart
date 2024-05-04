// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shoe_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ShoeModelAdapter extends TypeAdapter<ShoeModel> {
  @override
  final int typeId = 1;

  @override
  ShoeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ShoeModel(
      averageRating: fields[0] as String,
      brandId: fields[1] as String,
      brandName: fields[2] as String,
      colors: (fields[3] as Map).cast<String, String>(),
      description: fields[4] as String,
      imageUrl: fields[5] as String,
      price: fields[6] as String,
      productId: fields[7] as String,
      productName: fields[8] as String,
      reviews: (fields[9] as List).cast<ReviewModel>(),
      sizes: (fields[10] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, ShoeModel obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.averageRating)
      ..writeByte(1)
      ..write(obj.brandId)
      ..writeByte(2)
      ..write(obj.brandName)
      ..writeByte(3)
      ..write(obj.colors)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.imageUrl)
      ..writeByte(6)
      ..write(obj.price)
      ..writeByte(7)
      ..write(obj.productId)
      ..writeByte(8)
      ..write(obj.productName)
      ..writeByte(9)
      ..write(obj.reviews)
      ..writeByte(10)
      ..write(obj.sizes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShoeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
