part of 'product_details_controller.dart';

class ProductDetailsState {
  const ProductDetailsState({
    required this.product,
    required this.quantity,
    required this.addProductCardFailureOrSuccess,
  });

  factory ProductDetailsState.initial() => ProductDetailsState(
        product: null,
        quantity: 1,
        addProductCardFailureOrSuccess: ResultOr.none(),
      );

  final ProductModel? product;
  final int quantity;
  final ResultOr<FirebaseFailure> addProductCardFailureOrSuccess;

  ProductDetailsState copyWith({
    ProductModel? product,
    int? quantity,
    ResultOr<FirebaseFailure>? addProductCardFailureOrSuccess,
  }) {
    return ProductDetailsState(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
      addProductCardFailureOrSuccess:
          addProductCardFailureOrSuccess ?? this.addProductCardFailureOrSuccess,
    );
  }

  @override
  String toString() {
    return '''ProductDetailsState(
      product: $product,
      quantity: $quantity,
      addProductCardFailureOrSuccess: $addProductCardFailureOrSuccess,
    )''';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductDetailsState &&
        other.product == product &&
        other.quantity == quantity &&
        addProductCardFailureOrSuccess == other.addProductCardFailureOrSuccess;
  }

  @override
  int get hashCode {
    return product.hashCode ^
        quantity.hashCode ^
        addProductCardFailureOrSuccess.hashCode;
  }
}
