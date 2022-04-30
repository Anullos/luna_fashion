import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';

import '../../order/domain/models/product_order_model.dart';
import '../../order/domain/types/order_status_type.dart';
import '../../order/infrastructure/dto/product_order_dto.dart';
import '../../shared/domain/models/user_model.dart';
import '../../shared/infrastructure/collections.dart';
import '../../shared/domain/models/product_model.dart';
import '../../shared/domain/failures/firebase_failure.dart';
import '../../shared/presentation/utils/result_or.dart';
import '../domain/cart_repository_interface.dart';

class CartRepositoryImplements extends CartRepositoryInterface {
  final FirebaseFirestore _firebaseFirestore;
  final Dio _httpClient;

  CartRepositoryImplements(this._firebaseFirestore, this._httpClient);

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
      ProductOrderModel product, int quantity, UserModel user) async {
    try {
      final currentCart = user.currentCart;

      final index =
          currentCart.indexWhere((element) => element.id == product.id);

      currentCart[index] = currentCart[index]
          .copyWith(quantity: currentCart[index].quantity + quantity);

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
    try {
      final data =
          products.map((e) => ProductOrderDto.fromDomain(e).toMap()).toList();

      final documentReference =
          await _firebaseFirestore.collection(ordersCollection).add({
        'userId': user.id,
        'userFullName': user.fullName,
        'products': data,
        'status': OrderStatusType.pending().toString(),
        'atCreated': DateTime.now().millisecondsSinceEpoch,
        'atUpdated': DateTime.now().millisecondsSinceEpoch,
      });

      await _firebaseFirestore
          .collection(ordersCollection)
          .doc(documentReference.id)
          .set({
        'id': documentReference.id,
      }, SetOptions(merge: true));

      await _firebaseFirestore.collection(userCollection).doc(user.id).set({
        'currentCart': [],
      }, SetOptions(merge: true));

      await sendNotification(products.length, user);

      return ResultOr.success();
    } catch (e, f) {
      log('Error: $e, Stack: $f');
      return ResultOr.failure(FirebaseFailure.unknownError());
    }
  }

  @override
  Future<void> sendNotification(int productsLength, UserModel user) async {
    try {
      final body = {
        'notification': {
          'title': 'Nuevo pedido',
          'body':
              '${user.fullName} a realizado un pedido con $productsLength produtos',
        },
        'priority': 'high',
        'data': {
          'click_action': 'FLUTTER_NOTIFICATION_CLICK',
          'id': '1',
          'status': 'done',
        },
        'to': '/topics/ORDERS',
      };

      final response = await _httpClient.post('', data: body);

      log('Response: $response');
    } catch (e, f) {
      log('Error: $e, Stack: $f');
    }
  }
}
