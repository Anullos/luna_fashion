import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../shared/domain/failures/firebase_failure.dart';
import '../../shared/domain/types/category_product_type.dart';
import '../../shared/presentation/utils/result_or.dart';
import '../../shared/presentation/utils/util_extensions.dart';
import '../../shared/presentation/utils/value_object.dart';
import '../domain/admin_repository_interface.dart';
import '../domain/vos/description_vos.dart';
import '../domain/vos/name_vos.dart';
import '../domain/vos/price_vos.dart';

part 'add_product_state.dart';

class AddProductController extends StateNotifier<AddProductState> {
  AddProductController(this._repository) : super(AddProductState.initial());
  final AdminRepositoryInterface _repository;

  Future<void> signIn() async {}

  void nameChanged(String value) {
    state = state.copyWith(name: NameVos(value));
  }

  void descriptionChanged(String value) {
    state = state.copyWith(description: DescriptionVos(value));
  }

  void categoryChanged(CategoryProductType value) {
    state = state.copyWith(category: value);
  }

  void imagePathChanged(String value) {
    state = state.copyWith(imagePath: value);
  }

  void priceChanged(double value) {
    state = state.copyWith(price: PriceVos(value));
  }

  void oldPriceChanged(double value) {
    state = state.copyWith(oldPrice: PriceVos(value));
  }

  Future<void> addProduct() async {
    if (_allFieldsAreValid()) {
      if (state.imagePath != null) {
        state = state.copyWith(addProductFailureOrSuccess: ResultOr.loading());
        final result = await _repository.addProduct(
          name: state.name.getOrCrash(),
          description: state.description.getOrCrash(),
          category: state.category,
          imagePath: state.imagePath!,
          price: state.price.getOrCrash(),
          oldPrice: state.oldPrice.getOrCrash(),
        );
        state = state.copyWith(addProductFailureOrSuccess: result);
        state = state.copyWith(addProductFailureOrSuccess: ResultOr.none());
      } else {
        state = state.copyWith(showErrorImage: true);
        state = state.copyWith(showErrorImage: false);
      }
    } else {
      state = state.copyWith(showErrors: true);
    }
  }

  Future<void> pickImage(bool iscamera) async {
    final pickedFile = await ImagePicker().pickImage(
      source: iscamera ? ImageSource.camera : ImageSource.gallery,
      imageQuality: 100,
    );
    if (pickedFile != null) {
      imagePathChanged(pickedFile.path);
    }
  }

  bool _allFieldsAreValid() => <ValueObject>[
        state.name,
        state.description,
        state.price,
        state.oldPrice,
      ].areValid;

  Future<void> deleteProduct(String productId) async {
    await _repository.deleteProduct(productId: productId);
  }
}
