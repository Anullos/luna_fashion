import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../shared/domain/failures/firebase_failure.dart';
import '../../shared/domain/models/product_model.dart';
import '../../shared/domain/types/category_product_type.dart';
import '../../shared/presentation/utils/resource.dart';
import '../domain/products_repository_interface.dart';

part 'products_state.dart';

class ProductsController extends StateNotifier<ProductsState> {
  ProductsController(this._repository) : super(ProductsState.initial());
  final ProductsRepositoryInterface _repository;

  Future<void> signIn() async {}

  void categoryChanged(CategoryProductType value) {
    // CategoryProductType category;
    // switch (index) {
    //   case CategoryProductType.pants().toString():
    //     category = CategoryProductType.pants();
    //     break;
    //   case 1:
    //     category = CategoryProductType.shoes();
    //     break;
    //   case 2:
    //     category = CategoryProductType.tshirts();
    //     break;
    //   case 3:
    //     category = CategoryProductType.sweatshirts();
    //     break;
    //   case 4:
    //     category = CategoryProductType.caps();
    //     break;
    //   case 5:
    //     category = CategoryProductType.dresses();
    //     break;
    //   default:
    //     category = CategoryProductType.pants();
    //     break;
    // }
    state = state.copyWith(categorySelected: value);
  }

  Future<void> getProducts() async {
    state = state.copyWith(productsFailureOrSuccess: Resource.loading());
    final result = await _repository.getProducts();
    state = state.copyWith(productsFailureOrSuccess: result);
  }
}
