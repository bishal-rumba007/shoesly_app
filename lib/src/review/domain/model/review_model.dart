import 'package:hive/hive.dart';

part 'review_model.g.dart'; // Name of the generated file

@HiveType(typeId: 3) // Unique typeId for Hive
class ReviewModel {
  @HiveField(0)
  final String reviewId;
  @HiveField(1)
  final String dateTime;
  @HiveField(2)
  final String productId;
  @HiveField(3)
  final String profileUrl;
  @HiveField(4)
  final int rating;
  @HiveField(5)
  final String review;
  @HiveField(6)
  final String userName;

  ReviewModel({
    required this.reviewId,
    required this.dateTime,
    required this.productId,
    required this.profileUrl,
    required this.rating,
    required this.review,
    required this.userName,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      reviewId: json['id'],
      dateTime: json['dateTime'],
      productId: json['productId'],
      profileUrl: json['profileUrl'],
      rating: json['rating'],
      review: json['review'],
      userName: json['userName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': reviewId,
      'dateTime': dateTime,
      'productId': productId,
      'profileUrl': profileUrl,
      'rating': rating,
      'review': review,
      'userName': userName,
    };
  }
}