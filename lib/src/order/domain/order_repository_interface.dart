import '../../shared/domain/failures/firebase_failure.dart';
import '../../shared/presentation/utils/result_or.dart';
import 'models/order_model.dart';
import 'types/order_status_type.dart';

abstract class OrderRepositoryInterface {
  Stream<List<OrderModel>> findOrders();
  Future<void> updateOrder(String orderId, OrderStatusType status);
  Future<ResultOr<FirebaseFailure>> createOrder(OrderModel order);
}
