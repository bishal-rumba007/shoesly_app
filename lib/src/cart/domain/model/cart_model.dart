import 'package:hive_flutter/hive_flutter.dart';
import 'package:shoesly_app/src/discover/domain/models/shoe_model.dart';

part 'cart_model.g.dart';

@HiveType(typeId: 0)
class CartModel {
  @HiveField(0)
  final ShoeModel shoe;

  @HiveField(1)
  final String selectedColor;

  @HiveField(2)
  final String selectedSize;

  @HiveField(3)
  int quantity;

  @HiveField(4)
  double totalPrice;

  CartModel(
      {required this.shoe,
      required this.quantity,
      required this.totalPrice,
      required this.selectedColor,
      required this.selectedSize});
}
