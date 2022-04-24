import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../shared/domain/failures/firebase_failure.dart';
import '../../shared/domain/models/product_model.dart';
import '../../shared/domain/models/user_model.dart';
import '../../shared/presentation/utils/result_or.dart';
import '../domain/cart_repository_interface.dart';

part 'product_details_state.dart';

class ProductDetailsController extends StateNotifier<ProductDetailsState> {
  ProductDetailsController(this._repository)
      : super(ProductDetailsState.initial());
  final CartRepositoryInterface _repository;

  void productChanged(ProductModel value) {
    state = state.copyWith(product: value);
  }

  void quantityChanged(int value) {
    if (state.quantity >= 1 && value >= 0 || state.quantity > 1) {
      state = state.copyWith(quantity: state.quantity + value);
    }
  }

  Future<void> addProductCart(ProductModel product, UserModel user) async {
    state = state.copyWith(addProductCardFailureOrSuccess: ResultOr.loading());
    final result =
        await _repository.addCartProduct(product, state.quantity, user);
    state = state.copyWith(addProductCardFailureOrSuccess: result);
  }
}
