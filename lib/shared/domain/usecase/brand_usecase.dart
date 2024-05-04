

import 'package:dartz/dartz.dart';
import 'package:shoesly_app/core/exception/failure.dart';
import 'package:shoesly_app/shared/domain/models/brand_model.dart';
import 'package:shoesly_app/shared/domain/repositories/brand_repository.dart';
import 'package:shoesly_app/shared/domain/usecase/usecase.dart';





class GetBrandsUseCase implements UseCase<List<Brand>, NoParams> {
  final BrandRepository repository;

  GetBrandsUseCase(this.repository);

  @override
  Future<Either<Failure, List<Brand>>> call(NoParams params) async {
    return await repository.getBrands();
  }
}