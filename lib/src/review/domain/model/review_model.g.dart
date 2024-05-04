// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ReviewModelAdapter extends TypeAdapter<ReviewModel> {
  @override
  final int typeId = 3;

  @override
  ReviewModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ReviewModel(
      reviewId: fields[0] as String,
      dateTime: fields[1] as String,
      productId: fields[2] as String,
      profileUrl: fields[3] as String,
      rating: fields[4] as int,
      review: fields[5] as String,
      userName: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ReviewModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.reviewId)
      ..writeByte(1)
      ..write(obj.dateTime)
      ..writeByte(2)
      ..write(obj.productId)
      ..writeByte(3)
      ..write(obj.profileUrl)
      ..writeByte(4)
      ..write(obj.rating)
      ..writeByte(5)
      ..write(obj.review)
      ..writeByte(6)
      ..write(obj.userName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReviewModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
