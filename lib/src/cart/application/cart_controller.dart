import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../order/domain/models/product_order_model.dart';
import '../../product/domain/cart_repository_interface.dart';
import '../../shared/domain/failures/firebase_failure.dart';
import '../../shared/domain/models/product_model.dart';
import '../../shared/domain/models/user_model.dart';
import '../../shared/presentation/utils/result_or.dart';

part 'cart_state.dart';

class CartController extends StateNotifier<CartState> {
  CartController(this._repository) : super(CartState.initial());
  final CartRepositoryInterface _repository;

  void productChanged(ProductModel value) {
    state = state.copyWith(product: value);
  }

  void quantityChanged(int value) {
    if (state.quantity >= 1 && value >= 0 || state.quantity > 1) {
      state = state.copyWith(quantity: state.quantity + value);
    }
  }

  Future<void> removeProductCart(
      ProductOrderModel product, UserModel user) async {
    state =
        state.copyWith(removeCardProductFailureOrSuccess: ResultOr.loading());
    final result = await _repository.removeCartProduct(product.id, user);
    state = state.copyWith(removeCardProductFailureOrSuccess: result);
    state = state.copyWith(removeCardProductFailureOrSuccess: ResultOr.none());
  }
}
