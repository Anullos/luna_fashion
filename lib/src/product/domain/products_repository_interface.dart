import '../../shared/domain/models/product_model.dart';

abstract class ProductsRepositoryInterface {
  Stream<List<ProductModel>> getProducts();
}
