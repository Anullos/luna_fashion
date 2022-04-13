import '../../shared/domain/failures/firebase_failure.dart';
import '../../shared/domain/models/product_model.dart';
import '../../shared/presentation/utils/resource.dart';

abstract class ProductsRepositoryInterface {
  Future<Resource<FirebaseFailure, List<ProductModel>>> getProducts();
}
