import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shoesly_app/src/cart/domain/model/cart_model.dart';

part 'cart_state.freezed.dart';

@freezed
abstract class CartState with _$CartState {
  const factory CartState.loading() = _Loading;
  const factory CartState.loaded(List<CartModel> cartItems) = _Loaded;
  const factory CartState.error(String message) = _Error;
}