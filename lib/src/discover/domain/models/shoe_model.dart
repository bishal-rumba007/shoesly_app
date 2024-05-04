

import 'package:hive_flutter/hive_flutter.dart';
import 'package:shoesly_app/src/review/domain/model/review_model.dart';

part 'shoe_model.g.dart';

@HiveType(typeId: 1)
class ShoeModel {
  @HiveField(0)
  final String averageRating;
  @HiveField(1)
  final String brandId;
  @HiveField(2)
  final String brandName;
  @HiveField(3)
  final Map<String, String> colors;
  @HiveField(4)
  final String description;
  @HiveField(5)
  final String imageUrl;
  @HiveField(6)
  final String price;
  @HiveField(7)
  final String productId;
  @HiveField(8)
  final String productName;
  @HiveField(9)
  final List<ReviewModel> reviews;
  @HiveField(10)
  final List<String> sizes;

  ShoeModel({
    required this.averageRating,
    required this.brandId,
    required this.brandName,
    required this.colors,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.productId,
    required this.productName,
    required this.reviews,
    required this.sizes,
  });

  factory ShoeModel.fromJson(Map<String, dynamic> json) {
    return ShoeModel(
      averageRating: json['averageRating'],
      brandId: json['brandId'],
      brandName: json['brandName'],
      colors: Map<String, String>.from(json['colors']),
      description: json['description'],
      imageUrl: json['imageUrl'],
      price: json['price'],
      productId: json['id'],
      productName: json['productName'],
      reviews: json['reviews'],
      sizes: List<String>.from(json['sizes']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'averageRating': averageRating,
      'brandId': brandId,
      'brandName': brandName,
      'colors': colors,
      'description': description,
      'imageUrl': imageUrl,
      'price': price,
      'productId': productId,
      'productName': productName,
      'reviews': reviews,
      'sizes': sizes,
    };
  }
}