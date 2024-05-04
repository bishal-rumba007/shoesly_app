

import 'package:dartz/dartz.dart';
import 'package:shoesly_app/core/exception/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams {}