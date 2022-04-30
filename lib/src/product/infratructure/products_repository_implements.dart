import 'package:cloud_firestore/cloud_firestore.dart';

import '../../shared/infrastructure/collections.dart';
import '../../shared/infrastructure/dto/product_dto.dart';
import '../../shared/domain/models/product_model.dart';
import '../domain/products_repository_interface.dart';

class ProductsRepositoryImplements extends ProductsRepositoryInterface {
  final FirebaseFirestore _firebaseFirestore;

  ProductsRepositoryImplements(this._firebaseFirestore);

  @override
  Stream<List<ProductModel>> getProducts() async* {
    try {
      final snapshots =
          _firebaseFirestore.collection(productCollection).snapshots();

      yield* snapshots.map((snapshot) {
        final list = snapshot.docs
            .map((e) => ProductDto.fromMap(e.data()).toDomain())
            .toList();
        return list;
      });
    } catch (e) {
      yield [];
    }
  }
}
