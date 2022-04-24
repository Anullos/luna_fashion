part of 'cart_controller.dart';

class CartState {
  const CartState({
    required this.product,
    required this.quantity,
    required this.updateCardProductFailureOrSuccess,
    required this.removeCardProductFailureOrSuccess,
  });

  factory CartState.initial() => CartState(
        product: null,
        quantity: 1,
        updateCardProductFailureOrSuccess: ResultOr.none(),
        removeCardProductFailureOrSuccess: ResultOr.none(),
      );

  final ProductModel? product;
  final int quantity;
  final ResultOr<FirebaseFailure> updateCardProductFailureOrSuccess;
  final ResultOr<FirebaseFailure> removeCardProductFailureOrSuccess;

  CartState copyWith({
    ProductModel? product,
    int? quantity,
    ResultOr<FirebaseFailure>? updateCardProductFailureOrSuccess,
    ResultOr<FirebaseFailure>? removeCardProductFailureOrSuccess,
  }) {
    return CartState(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
      updateCardProductFailureOrSuccess: updateCardProductFailureOrSuccess ??
          this.updateCardProductFailureOrSuccess,
      removeCardProductFailureOrSuccess: removeCardProductFailureOrSuccess ??
          this.removeCardProductFailureOrSuccess,
    );
  }

  @override
  String toString() {
    return '''CartState(
      product: $product,
      quantity: $quantity,
      updateCardProductFailureOrSuccess: $updateCardProductFailureOrSuccess,
      removeCardProductFailureOrSuccess: $removeCardProductFailureOrSuccess,
    )''';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CartState &&
        other.product == product &&
        other.quantity == quantity &&
        updateCardProductFailureOrSuccess ==
            other.updateCardProductFailureOrSuccess &&
        removeCardProductFailureOrSuccess ==
            other.removeCardProductFailureOrSuccess;
  }

  @override
  int get hashCode {
    return product.hashCode ^
        quantity.hashCode ^
        updateCardProductFailureOrSuccess.hashCode ^
        removeCardProductFailureOrSuccess.hashCode;
  }
}
