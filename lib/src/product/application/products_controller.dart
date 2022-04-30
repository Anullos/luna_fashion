import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../shared/domain/failures/firebase_failure.dart';
import '../../shared/domain/models/product_model.dart';
import '../../shared/domain/types/category_product_type.dart';
import '../../shared/presentation/utils/resource.dart';
part 'products_state.dart';

class ProductsController extends StateNotifier<ProductsState> {
  ProductsController() : super(ProductsState.initial());

  Future<void> signIn() async {}

  void categoryChanged(CategoryProductType value) {
    state = state.copyWith(categorySelected: value);
  }
}
