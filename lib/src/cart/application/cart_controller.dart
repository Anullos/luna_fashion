import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../order/domain/models/product_order_model.dart';
import '../../product/domain/cart_repository_interface.dart';
import '../../shared/domain/failures/firebase_failure.dart';
import '../../shared/domain/models/user_model.dart';
import '../../shared/presentation/utils/result_or.dart';

part 'cart_state.dart';

class CartController extends StateNotifier<CartState> {
  CartController(this._repository) : super(CartState.initial());
  final CartRepositoryInterface _repository;

  Future<void> removeProductCart(
      ProductOrderModel product, UserModel user) async {
    state =
        state.copyWith(removeCardProductFailureOrSuccess: ResultOr.loading());
    final result = await _repository.removeCartProduct(product.id, user);
    state = state.copyWith(removeCardProductFailureOrSuccess: result);
    state = state.copyWith(removeCardProductFailureOrSuccess: ResultOr.none());
  }

  Future<void> updateProductCart(
      ProductOrderModel product, int quantity, UserModel user) async {
    if (product.quantity == 1 && quantity == -1) {
      removeProductCart(product, user);
      return;
    }
    state =
        state.copyWith(updateCardProductFailureOrSuccess: ResultOr.loading());
    final result = await _repository.updateCartProduct(product, quantity, user);
    state = state.copyWith(updateCardProductFailureOrSuccess: result);
    state = state.copyWith(updateCardProductFailureOrSuccess: ResultOr.none());
  }

  Future<void> createOrder(UserModel user) async {
    state = state.copyWith(createOrderFailureOrSuccess: ResultOr.loading());
    final result = await _repository.createOrder(user.currentCart, user);
    state = state.copyWith(createOrderFailureOrSuccess: result);
    state = state.copyWith(createOrderFailureOrSuccess: ResultOr.none());
  }
}
