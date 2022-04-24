import 'package:cloud_firestore/cloud_firestore.dart';

import '../../order/domain/models/product_order_model.dart';
import '../../order/infrastructure/dto/product_order_dto.dart';
import '../../shared/domain/models/user_model.dart';
import '../../shared/infrastructure/collections.dart';
import '../../shared/domain/models/product_model.dart';
import '../../shared/domain/failures/firebase_failure.dart';
import '../../shared/presentation/utils/result_or.dart';
import '../domain/cart_repository_interface.dart';

class CartRepositoryImplements extends CartRepositoryInterface {
  final FirebaseFirestore _firebaseFirestore;

  CartRepositoryImplements(this._firebaseFirestore);

  @override
  Future<ResultOr<FirebaseFailure>> addCartProduct(
      ProductModel product, int quantity, UserModel user) async {
    try {
      final productOrder = ProductOrderModel(
        id: product.id,
        product: product,
        quantity: quantity,
      );
      final currentCart = user.currentCart;
      currentCart.add(productOrder);

      final data = currentCart
          .map((e) => ProductOrderDto.fromDomain(e).toMap())
          .toList();

      await _firebaseFirestore
          .collection(userCollection)
          .doc(user.id)
          .set({'currentCart': data}, SetOptions(merge: true));

      return ResultOr.success();
    } catch (e, _) {
      return ResultOr.failure(FirebaseFailure.unknownError());
    }
  }

  @override
  Future<ResultOr<FirebaseFailure>> removeCartProduct(
      String productId, UserModel user) async {
    try {
      final currentCart = user.currentCart;
      currentCart.removeWhere((productOrder) => productOrder.id == productId);

      await _firebaseFirestore
          .collection(userCollection)
          .doc(user.id)
          .set({'currentCart': currentCart}, SetOptions(merge: true));

      return ResultOr.success();
    } catch (e, _) {
      return ResultOr.failure(FirebaseFailure.unknownError());
    }
  }

  @override
  Future<ResultOr<FirebaseFailure>> updateCartProduct(
      ProductModel product, int quantity, UserModel user) async {
    try {
      final currentCart = user.currentCart;
      final productOrder = currentCart.firstWhere(
        (productOrder) => productOrder.id == product.id,
      );
      productOrder.copyWith(quantity: quantity);

      final data = currentCart
          .map((e) => ProductOrderDto.fromDomain(e).toMap())
          .toList();

      _firebaseFirestore
          .collection(userCollection)
          .doc(user.id)
          .set({'currentCart': data}, SetOptions(merge: true));

      return ResultOr.success();
    } catch (e, _) {
      return ResultOr.failure(FirebaseFailure.unknownError());
    }
  }

  @override
  Future<ResultOr<FirebaseFailure>> createOrder(
      List<ProductOrderModel> products, UserModel user) async {
    throw UnimplementedError();
  }
}
