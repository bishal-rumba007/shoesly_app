import 'package:hive_flutter/hive_flutter.dart';
import 'package:shoesly_app/src/cart/domain/model/cart_model.dart';

class CartDataSource {
  final Box<CartModel> _cartBox = Hive.box<CartModel>('cartBox');


  List<CartModel> getCartItems() {
    return _cartBox.values.toList();
  }

  Future<void> addCartItem(CartModel cartItem) async {
    final existingItem = _cartBox.values.toList().firstWhere(
          (item) => item.shoe.productId == cartItem.shoe.productId &&
          item.selectedColor == cartItem.selectedColor &&
          item.selectedSize == cartItem.selectedSize, // If no matching item is found, return null
      orElse: () => cartItem,
    );

    if (existingItem != cartItem) {
      // Item exists in the cart, so update its quantity and total price
      existingItem.quantity += 1;
      existingItem.totalPrice = existingItem.quantity * double.parse(existingItem.shoe.price);
      await _cartBox.putAt(_cartBox.values.toList().indexOf(existingItem), existingItem);
    } else {
      // The item does not exist in the cart, so add it.
      await _cartBox.add(cartItem);
    }
  }


  Future<void> removeCartItem(CartModel cartItem) async {
      final existingItem = _cartBox.values.toList().firstWhere(
              (item) => item.shoe.productId == cartItem.shoe.productId
              && item.selectedColor == cartItem.selectedColor
              && item.selectedSize == cartItem.selectedSize
      );
      final index = _cartBox.values.toList().indexOf(existingItem);
      await _cartBox.deleteAt(index);
  }

  Future<void> incrementQuantity(CartModel cartItem) async {
    final index = _cartBox.values.toList().indexOf(cartItem);
    if (index != -1) {
      final item = _cartBox.getAt(index);
      item!.quantity += 1;
      item.totalPrice = item.quantity * double.parse(item.shoe.price);
      await _cartBox.putAt(index, item);
    }
  }

  Future<void> decrementQuantity(CartModel cartItem) async {
    final index = _cartBox.values.toList().indexOf(cartItem);
    if (index != -1) {
      final item = _cartBox.getAt(index);
      if (item!.quantity > 1) {
        item.quantity -= 1;
        item.totalPrice = item.quantity * double.parse(item.shoe.price);
        await _cartBox.putAt(index, item);
      }
    }
  }

  Future<void> clearCart() async {
    await _cartBox.clear();
  }

}