




import 'package:dartz/dartz.dart';
import 'package:shoesly_app/core/exception/failure.dart';
import 'package:shoesly_app/src/review/data/datasource/review_datasource.dart';
import 'package:shoesly_app/src/review/domain/model/review_model.dart';
import 'package:shoesly_app/src/review/domain/repository/review_repository.dart';

class ReviewRepositoryImpl implements ReviewRepository {
  final ReviewDataSource reviewDataSource;

  ReviewRepositoryImpl({
    required this.reviewDataSource,
  });

  @override
  Future<Either<Failure, List<ReviewModel>>> getReviews(String productId) async {
    return await reviewDataSource.getReviews(productId);
  }
}