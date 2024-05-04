

import 'package:dartz/dartz.dart';
import 'package:shoesly_app/core/exception/failure.dart';
import 'package:shoesly_app/src/discover/data/datasource/product_datasource.dart';
import 'package:shoesly_app/src/discover/domain/models/shoe_model.dart';
import 'package:shoesly_app/src/discover/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductDataSource productDataSource;

  ProductRepositoryImpl({
    required this.productDataSource,
  });

  @override
  Future<Either<Failure, List<ShoeModel>>> getProducts() async {
    return await productDataSource.getProducts();
  }
}