


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoesly_app/shared/cubit/brand_state.dart';
import 'package:shoesly_app/shared/domain/usecase/brand_usecase.dart';
import 'package:shoesly_app/shared/domain/usecase/usecase.dart';

class BrandCubit extends Cubit<BrandState>{
  final GetBrandsUseCase getBrandsUseCase;

  BrandCubit(this.getBrandsUseCase) : super(const BrandInitialState());

  Future<void> getBrands() async {
    emit(const BrandLoadingState());
    final result = await getBrandsUseCase(NoParams());
    result.fold(
      (failure) => emit(BrandErrorState(failure)),
      (brands) => emit(BrandLoadedState(brands))
    );
  }
}