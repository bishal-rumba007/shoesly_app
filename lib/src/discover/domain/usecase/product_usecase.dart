


import 'package:dartz/dartz.dart';
import 'package:shoesly_app/core/exception/failure.dart';
import 'package:shoesly_app/shared/domain/usecase/usecase.dart';
import 'package:shoesly_app/src/discover/domain/models/shoe_model.dart';
import 'package:shoesly_app/src/discover/domain/repositories/product_repository.dart';

class GetProductUseCase implements UseCase<List<ShoeModel>, NoParams>{
  final ProductRepository repository;

  GetProductUseCase(this.repository);

  @override
  Future<Either<Failure, List<ShoeModel>>> call(NoParams params) async {
    return await repository.getProducts();
  }

}