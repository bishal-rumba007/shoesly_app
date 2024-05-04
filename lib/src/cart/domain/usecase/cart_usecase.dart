
import 'package:shoesly_app/src/cart/domain/model/cart_model.dart';
import 'package:shoesly_app/src/cart/domain/repositories/cart_repository.dart';

class GetCartItemsUseCase {
  final CartRepository cartRepository;

  GetCartItemsUseCase({required this.cartRepository});

  List<CartModel> execute() {
    return cartRepository.getCartItems();
  }

  void addCartItem(CartModel cartItem) {
    cartRepository.addCartItem(cartItem);
  }

  void removeCartItem(CartModel cartItem) {
    cartRepository.removeCartItem(cartItem);
  }
}