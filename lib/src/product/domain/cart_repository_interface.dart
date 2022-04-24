import '../../order/domain/models/product_order_model.dart';
import '../../shared/domain/failures/firebase_failure.dart';
import '../../shared/domain/models/product_model.dart';
import '../../shared/domain/models/user_model.dart';
import '../../shared/presentation/utils/result_or.dart';

abstract class CartRepositoryInterface {
  Future<ResultOr<FirebaseFailure>> addCartProduct(
      ProductModel product, int quantity, UserModel user);
  Future<ResultOr<FirebaseFailure>> removeCartProduct(
      String productId, UserModel user);

  Future<ResultOr<FirebaseFailure>> updateCartProduct(
      ProductModel product, int quantity, UserModel user);

  Future<ResultOr<FirebaseFailure>> createOrder(
      List<ProductOrderModel> products, UserModel user);
}
