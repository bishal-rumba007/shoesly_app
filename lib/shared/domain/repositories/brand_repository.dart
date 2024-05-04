

import 'package:dartz/dartz.dart';
import 'package:shoesly_app/core/exception/failure.dart';
import 'package:shoesly_app/shared/domain/models/brand_model.dart';

abstract class BrandRepository {
  Future<Either<Failure, List<Brand>>> getBrands();
}