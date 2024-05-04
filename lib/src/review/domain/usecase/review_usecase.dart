




import 'package:dartz/dartz.dart';
import 'package:shoesly_app/core/exception/failure.dart';
import 'package:shoesly_app/shared/domain/usecase/usecase.dart';
import 'package:shoesly_app/src/review/domain/model/review_model.dart';
import 'package:shoesly_app/src/review/domain/repository/review_repository.dart';

class GetReviewsUsecase implements UseCase<List<ReviewModel>, String> {
  final ReviewRepository reviewRepository;

  GetReviewsUsecase({required this.reviewRepository});

  @override
  Future<Either<Failure, List<ReviewModel>>> call(String productId) async{
    return await reviewRepository.getReviews(productId);
  }
}