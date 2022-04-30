import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../order/domain/models/order_model.dart';
import '../../order/domain/types/order_status_type.dart';
import '../../order/infrastructure/dto/order_dto.dart';
import '../../shared/domain/models/product_model.dart';
import '../../shared/infrastructure/collections.dart';
import '../../shared/infrastructure/dto/product_dto.dart';
import '../../shared/presentation/utils/result_or.dart';
import '../../shared/domain/types/category_product_type.dart';
import '../../shared/domain/failures/firebase_failure.dart';
import '../domain/admin_repository_interface.dart';

class AdminRepositoryImplements extends AdminRepositoryInterface {
  final FirebaseFirestore _firebaseFirestore;
  final FirebaseStorage _firebaseStorage;

  AdminRepositoryImplements(this._firebaseFirestore, this._firebaseStorage);

  @override
  Future<ResultOr<FirebaseFailure>> addProduct(
      {required String name,
      required String description,
      required CategoryProductType category,
      required String imagePath,
      required double price,
      required double oldPrice}) async {
    try {
      final imageUrl = await uploadImageProduct(imagePath: imagePath);

      final documentReference =
          await _firebaseFirestore.collection(productCollection).add({
        'name': name,
        'description': description,
        'category': category.toString(),
        'imageUrl': imageUrl,
        'price': price,
        'oldPrice': oldPrice,
      });
      await _firebaseFirestore
          .collection(productCollection)
          .doc(documentReference.id)
          .set({
        'id': documentReference.id,
      }, SetOptions(merge: true));

      return ResultOr.success();
    } catch (e, _) {
      return ResultOr.failure(FirebaseFailure.unknownError());
    }
  }

  @override
  Future<ResultOr<FirebaseFailure>> deleteProduct(
      {required String productId}) async {
    try {
      _firebaseFirestore.collection(productCollection).doc(productId).delete();
      return ResultOr.success();
    } catch (e, _) {
      return ResultOr.failure(FirebaseFailure.unknownError());
    }
  }

  @override
  Stream<List<ProductModel>> getProducts() async* {
    try {
      final snapshots =
          _firebaseFirestore.collection(productCollection).snapshots();
      yield* snapshots.map((snapshot) {
        final products = snapshot.docs
            .map((e) => ProductDto.fromMap(e.data()).toDomain())
            .toList();
        return products;
      });
    } catch (e) {
      yield [];
    }
  }

  @override
  Future<String?> uploadImageProduct({required String imagePath}) async {
    final fileName = imagePath.split('/').last;

    final remotePath = 'products/photos/$fileName';
    final storageReference = _firebaseStorage.ref(remotePath);
    try {
      final task = await storageReference.putFile(File(imagePath));
      final url = await task.ref.getDownloadURL();
      return url;
    } on FirebaseException catch (e, _) {
      return null;
    }
  }

  @override
  Stream<List<OrderModel>> getOrders() async* {
    try {
      final snapshots =
          _firebaseFirestore.collection(ordersCollection).snapshots();
      yield* snapshots.map((snapshot) {
        final orders = snapshot.docs
            .map((e) => OrderDto.fromMap(e.data()).toDomain())
            .toList();
        return orders;
      });
    } catch (e) {
      yield [];
    }
  }

  @override
  Future<ResultOr<FirebaseFailure>> updateStatusOrder(
      {required String orderId, required OrderStatusType status}) async {
    try {
      await _firebaseFirestore
          .collection(ordersCollection)
          .doc(orderId)
          .update({
        'status': status.toString(),
      });

      return ResultOr.success();
    } catch (e, _) {
      return ResultOr.failure(FirebaseFailure.unknownError());
    }
  }
}
