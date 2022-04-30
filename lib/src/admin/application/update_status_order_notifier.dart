import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../order/domain/types/order_status_type.dart';
import '../../shared/domain/failures/firebase_failure.dart';
import '../../shared/presentation/utils/result_or.dart';
import '../domain/admin_repository_interface.dart';

class UpdateOrderNotifier extends StateNotifier<ResultOr<FirebaseFailure>> {
  UpdateOrderNotifier(this._repository) : super(ResultOr.none());
  final AdminRepositoryInterface _repository;

  Future<void> addProduct(String orderId, OrderStatusType status) async {
    state = ResultOr.loading();
    final result =
        await _repository.updateStatusOrder(orderId: orderId, status: status);
    state = result;
    state = ResultOr.none();
  }
}
