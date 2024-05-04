
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoesly_app/src/review/domain/usecase/review_usecase.dart';
import 'package:shoesly_app/src/review/presentation/cubit/review_state.dart';

class ReviewCubit extends Cubit<ReviewState>{
  final GetReviewsUsecase getReviewUseCase;

  ReviewCubit({required this.getReviewUseCase}) : super(const ReviewState.initial());


  Future<void> getReviews(String productId) async {
    emit(const ReviewState.loading());
    final result = await getReviewUseCase(productId);
    result.fold(
      (failure) => emit(ReviewState.error(failure.message)),
      (reviews) => emit(ReviewState.loaded(reviews)),
    );
  }

}
