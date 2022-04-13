import 'package:cloud_firestore/cloud_firestore.dart';

import '../../shared/infrastructure/collections.dart';
import '../../shared/infrastructure/dto/product_dto.dart';
import '../../shared/presentation/utils/resource.dart';
import '../../shared/domain/models/product_model.dart';
import '../../shared/domain/failures/firebase_failure.dart';
import '../domain/products_repository_interface.dart';

class ProductsRepositoryImplements extends ProductsRepositoryInterface {
  final FirebaseFirestore _firebaseFirestore;

  ProductsRepositoryImplements(this._firebaseFirestore);

  @override
  Future<Resource<FirebaseFailure, List<ProductModel>>> getProducts() async {
    try {
      final data = await _firebaseFirestore.collection(productCollection).get();

      final products = data.docs
          .map((doc) => ProductDto.fromMap(doc.data()).toDomain())
          .toList();

      return Resource.success(products);
    } catch (e) {
      return Resource.failure(FirebaseFailure.unknownError());
    }
  }
}
