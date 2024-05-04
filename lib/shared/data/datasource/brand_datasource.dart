import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:shoesly_app/core/exception/failure.dart';
import 'package:shoesly_app/shared/domain/models/brand_model.dart';


abstract class BrandDataSource {
  Future<Either<Failure, List<Brand>>> getBrands();
}



class BrandDataSourceImpl implements BrandDataSource{

  final brandDb = FirebaseFirestore.instance.collection('brands');

  @override
  Future<Either<Failure, List<Brand>>> getBrands() async {
    try {
      final response = await brandDb.get();
      final brandList = await Future.wait(
        response.docs.map(
              (doc) async {
            final json = doc.data();
            return Brand.fromJson({
              ...json,
              'id': doc.id,
            });
          },
        ),
      );
      return right(brandList);
    } on FirebaseException catch (e) {
      return left(Failure(
          message: e.message ?? 'An error occurred',
      ));
    }
  }

}