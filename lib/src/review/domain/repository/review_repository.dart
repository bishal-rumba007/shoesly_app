




import 'package:dartz/dartz.dart';
import 'package:shoesly_app/core/exception/failure.dart';
import 'package:shoesly_app/src/review/domain/model/review_model.dart';

abstract class ReviewRepository {
  Future<Either<Failure, List<ReviewModel>>> getReviews(String productId);
}