import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoesly_app/shared/domain/usecase/usecase.dart';
import 'package:shoesly_app/src/discover/domain/usecase/product_usecase.dart';
import 'package:shoesly_app/src/discover/presentation/cubit/product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final GetProductUseCase getProductUseCase;

  ProductCubit(this.getProductUseCase) : super(const ProductState.initial());

  Future<void> getProducts() async {
    emit(const ProductState.loading());
    final result = await getProductUseCase(NoParams());
    result.fold(
          (failure) => emit(ProductState.error(failure.message)),
          (products) => emit(ProductState.loaded(products)),
    );
  }
}