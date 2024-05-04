



import 'package:dartz/dartz.dart';
import 'package:shoesly_app/core/exception/failure.dart';
import 'package:shoesly_app/src/discover/domain/models/shoe_model.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<ShoeModel>>> getProducts();
}