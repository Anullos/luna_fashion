import '../../shared/domain/failures/firebase_failure.dart';
import '../../shared/domain/models/product_model.dart';
import '../../shared/domain/types/category_product_type.dart';
import '../../shared/presentation/utils/result_or.dart';

abstract class AdminRepositoryInterface {
  Future<ResultOr<FirebaseFailure>> addProduct(
      {required String name,
      required String description,
      required CategoryProductType category,
      required String imagePath,
      required double price,
      required double oldPrice});

  Future<ResultOr<FirebaseFailure>> deleteProduct({required String productId});

  Stream<List<ProductModel>> getProducts();

  Future<String?> uploadImageProduct({required String imagePath});
}
