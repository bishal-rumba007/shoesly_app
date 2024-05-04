import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shoesly_app/core/exception/failure.dart';
import 'package:shoesly_app/shared/domain/models/brand_model.dart';

part 'brand_state.freezed.dart';

@freezed
class BrandState with _$BrandState {
  const factory BrandState.initial() = BrandInitialState;
  const factory BrandState.loading() = BrandLoadingState;
  const factory BrandState.loaded(List<Brand> brands) = BrandLoadedState;
  const factory BrandState.error(Failure failure) = BrandErrorState;
}