import 'package:cloud_firestore/cloud_firestore.dart';

import '../domain/models/order_model.dart';
import '../../shared/presentation/utils/result_or.dart';
import '../../shared/domain/failures/firebase_failure.dart';
import '../domain/order_repository_interface.dart';
import '../domain/types/order_status_type.dart';

class OrderRepositoryImplements extends OrderRepositoryInterface {
  final FirebaseFirestore _firebaseFirestore;

  OrderRepositoryImplements(this._firebaseFirestore);

  @override
  Future<ResultOr<FirebaseFailure>> createOrder(OrderModel order) {
    throw UnimplementedError();
  }

  @override
  Stream<List<OrderModel>> findOrders() async* {
    yield [];
  }

  @override
  Future<void> updateOrder(String orderId, OrderStatusType status) {
    throw UnimplementedError();
  }
}
