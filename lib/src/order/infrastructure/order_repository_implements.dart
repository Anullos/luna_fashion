import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../shared/infrastructure/collections.dart';
import '../domain/models/order_model.dart';
import '../domain/order_repository_interface.dart';
import '../domain/types/order_status_type.dart';
import 'dto/order_dto.dart';

class OrderRepositoryImplements extends OrderRepositoryInterface {
  final FirebaseFirestore _firebaseFirestore;
  final FirebaseAuth _firebaseAuth;

  OrderRepositoryImplements(this._firebaseFirestore, this._firebaseAuth);

  @override
  Stream<List<OrderModel>> findOrders() async* {
    final orders = _firebaseFirestore
        .collection(ordersCollection)
        .where('userId', isEqualTo: _firebaseAuth.currentUser!.uid)
        .orderBy('atCreated', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) {
              final data = doc.data();
              return OrderDto.fromMap(data).toDomain();
            }).toList());
    yield* orders;
  }

  @override
  Future<void> updateOrder(String orderId, OrderStatusType status) {
    throw UnimplementedError();
  }
}
