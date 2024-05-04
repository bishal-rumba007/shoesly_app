
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shoesly_app/src/discover/domain/models/shoe_model.dart';

part 'product_state.freezed.dart';

@freezed
class ProductState with _$ProductState {
  const factory ProductState.initial() = ProductInitialState;
  const factory ProductState.loading() = ProductLoadingState;
  const factory ProductState.loaded(List<ShoeModel> products) = ProductLoadedState;
  const factory ProductState.error(String error) = ProductErrorState;
}