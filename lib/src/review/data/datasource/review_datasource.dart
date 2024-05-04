




import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:shoesly_app/core/exception/failure.dart';
import 'package:shoesly_app/src/review/domain/model/review_model.dart';

abstract class ReviewDataSource {
  Future<Either<Failure, List<ReviewModel>>> getReviews(String productId);
}


class ReviewDataSourceImpl implements ReviewDataSource {
  final reviewDb = FirebaseFirestore.instance.collection('reviews');

  @override
  Future<Either<Failure, List<ReviewModel>>> getReviews(String productId) async {
    try {
      final response = await reviewDb.where('productId', isEqualTo: productId).get();
      final reviewList = response.docs.map(
            (doc) => ReviewModel.fromJson({
          ...doc.data(),
          'id': doc.id,
        }),
      ).toList();
      return right(reviewList);
    } on FirebaseException catch (e) {
      return left(Failure(
          message: e.message ?? 'An error occurred',
      ));
    }
  }
}
