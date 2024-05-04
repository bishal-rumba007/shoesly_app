


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:shoesly_app/core/exception/failure.dart';
import 'package:shoesly_app/src/discover/domain/models/shoe_model.dart';
import 'package:shoesly_app/src/review/domain/model/review_model.dart';

abstract class ProductDataSource {
  Future<Either<Failure, List<ShoeModel>>> getProducts();
}


class ProductDataSourceImpl implements ProductDataSource {

  final productDb = FirebaseFirestore.instance.collection('products');
  final reviewDb = FirebaseFirestore.instance.collection('reviews');

  /// Fetching all of the products from the database
  @override
  Future<Either<Failure, List<ShoeModel>>> getProducts() async {
    try {
      final response = await productDb.get();
      final productList = await Future.wait(
        response.docs.map(
              (doc) async {
            final json = doc.data();
            final reviews = await getReviews(doc.id);
            return ShoeModel.fromJson({
              ...json,
              'id': doc.id,
              'reviews': reviews,
            });
          },
        ),
      );
      return right(productList);
    } on FirebaseException catch (e) {
      return left(Failure(
          message: e.message ?? 'An error occurred',
      ));
    }
  }

  /// fetching top reviews for a product by productId
  Future<List<ReviewModel>> getReviews(String productId) async {
    try {
      final response = await reviewDb.where('productId', isEqualTo: productId).get();
      final reviewList = response.docs.map(
            (doc) => ReviewModel.fromJson({
          ...doc.data(),
          'id': doc.id,
        }),
      ).toList();
      return reviewList;
    } on FirebaseException {
      return [];
    }
  }

}