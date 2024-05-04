


import 'package:dartz/dartz.dart';
import 'package:shoesly_app/core/exception/failure.dart';
import 'package:shoesly_app/shared/data/datasource/brand_datasource.dart';
import 'package:shoesly_app/shared/domain/models/brand_model.dart';
import 'package:shoesly_app/shared/domain/repositories/brand_repository.dart';

class BrandRepositoryImpl implements BrandRepository {
  final BrandDataSource dataSource;

  BrandRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, List<Brand>>> getBrands() async {
    return await dataSource.getBrands();
  }
}