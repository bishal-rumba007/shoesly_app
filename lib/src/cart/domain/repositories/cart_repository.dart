


import 'package:shoesly_app/src/cart/domain/model/cart_model.dart';

class CartRepository {
  final List<CartModel> _cartItems = [];

  List<CartModel> getCartItems() {
    return _cartItems;
  }

  void addCartItem(CartModel cartItem) {
    _cartItems.add(cartItem);
  }

  void removeCartItem(CartModel cartItem) {
    _cartItems.remove(cartItem);
  }
}