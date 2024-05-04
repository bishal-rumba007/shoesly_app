
import 'package:shoesly_app/src/cart/data/datasource/cart_datasource.dart';
import 'package:shoesly_app/src/cart/domain/model/cart_model.dart';
import 'package:shoesly_app/src/cart/domain/repositories/cart_repository.dart';

class CartRepositoryImpl implements CartRepository {
  final CartDataSource cartDataSource;

  CartRepositoryImpl({required this.cartDataSource});

  @override
  Future<void> addCartItem(CartModel cartItem) async {
    await cartDataSource.addCartItem(cartItem);
  }

  @override
  Future<void> removeCartItem(CartModel cartItem) async {
    await cartDataSource.removeCartItem(cartItem);
  }

  @override
  List<CartModel> getCartItems() {
    return cartDataSource.getCartItems();
  }

  Future<void> incrementQuantity(CartModel cartItem) async {
    await cartDataSource.incrementQuantity(cartItem);
  }

  Future<void> decrementQuantity(CartModel cartItem) async {
    await cartDataSource.decrementQuantity(cartItem);
  }

  Future<void> clearCart() async {
    await cartDataSource.clearCart();
  }
}