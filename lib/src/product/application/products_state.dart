part of 'products_controller.dart';

class ProductsState {
  const ProductsState({
    required this.categorySelected,
    required this.productsFailureOrSuccess,
  });

  factory ProductsState.initial() => ProductsState(
        categorySelected: CategoryProductType.pants(),
        productsFailureOrSuccess: Resource.none(),
      );

  final CategoryProductType categorySelected;
  final Resource<FirebaseFailure, List<ProductModel>> productsFailureOrSuccess;

  ProductsState copyWith({
    CategoryProductType? categorySelected,
    Resource<FirebaseFailure, List<ProductModel>>? productsFailureOrSuccess,
  }) {
    return ProductsState(
      categorySelected: categorySelected ?? this.categorySelected,
      productsFailureOrSuccess:
          productsFailureOrSuccess ?? this.productsFailureOrSuccess,
    );
  }

  @override
  String toString() {
    return '''ProductsState(
      categorySelected: $categorySelected,
      productsFailureOrSuccess: $productsFailureOrSuccess,
    )''';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductsState &&
        categorySelected == other.categorySelected &&
        productsFailureOrSuccess == other.productsFailureOrSuccess;
  }

  @override
  int get hashCode {
    return categorySelected.hashCode ^ productsFailureOrSuccess.hashCode;
  }
}
