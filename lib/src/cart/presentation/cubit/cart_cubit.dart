
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoesly_app/src/cart/data/repositories/cart_repositories_impl.dart';
import 'package:shoesly_app/src/cart/domain/model/cart_model.dart';
import 'package:shoesly_app/src/cart/presentation/cubit/cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepositoryImpl cartRepository;

  CartCubit({required this.cartRepository}) : super(const CartState.loading());

  Future<void> loadCartItems() async {
    try {
      emit(const CartState.loading());
      final cartItems = cartRepository.getCartItems();
      emit(CartState.loaded(cartItems));
    } catch (e) {
      emit(const CartState.error('Failed to load cart items'));
    }
  }

  Future<void> addCartItem(CartModel cartItem) async {
    try {
      await cartRepository.addCartItem(cartItem);
      loadCartItems();
    } catch (e) {
      emit(const CartState.error('Failed to add item to cart'));
    }
  }

  Future<void> removeCartItem(CartModel cartItem) async {
    try {
      await cartRepository.removeCartItem(cartItem);
      loadCartItems();
    } catch (e) {
      emit(const CartState.error('Failed to remove item from cart'));
    }
  }

  Future<void> incrementQuantity(CartModel cartItem) async {
    await cartRepository.incrementQuantity(cartItem);
    loadCartItems();
  }

  Future<void> decrementQuantity(CartModel cartItem) async {
    await cartRepository.decrementQuantity(cartItem);
    loadCartItems();
  }

  Future<void> clearCart() async {
    await cartRepository.clearCart();
    loadCartItems();
  }
}