part of 'cart_controller.dart';

class CartState {
  const CartState({
    required this.updateCardProductFailureOrSuccess,
    required this.removeCardProductFailureOrSuccess,
    required this.createOrderFailureOrSuccess,
  });

  factory CartState.initial() => CartState(
        updateCardProductFailureOrSuccess: ResultOr.none(),
        removeCardProductFailureOrSuccess: ResultOr.none(),
        createOrderFailureOrSuccess: ResultOr.none(),
      );

  final ResultOr<FirebaseFailure> updateCardProductFailureOrSuccess;
  final ResultOr<FirebaseFailure> removeCardProductFailureOrSuccess;
  final ResultOr<FirebaseFailure> createOrderFailureOrSuccess;

  CartState copyWith({
    ResultOr<FirebaseFailure>? updateCardProductFailureOrSuccess,
    ResultOr<FirebaseFailure>? removeCardProductFailureOrSuccess,
    ResultOr<FirebaseFailure>? createOrderFailureOrSuccess,
  }) {
    return CartState(
      updateCardProductFailureOrSuccess: updateCardProductFailureOrSuccess ??
          this.updateCardProductFailureOrSuccess,
      removeCardProductFailureOrSuccess: removeCardProductFailureOrSuccess ??
          this.removeCardProductFailureOrSuccess,
      createOrderFailureOrSuccess:
          createOrderFailureOrSuccess ?? this.createOrderFailureOrSuccess,
    );
  }

  @override
  String toString() {
    return '''CartState(
      updateCardProductFailureOrSuccess: $updateCardProductFailureOrSuccess,
      removeCardProductFailureOrSuccess: $removeCardProductFailureOrSuccess,
      createOrderFailureOrSuccess: $createOrderFailureOrSuccess,
    )''';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CartState &&
        updateCardProductFailureOrSuccess ==
            other.updateCardProductFailureOrSuccess &&
        removeCardProductFailureOrSuccess ==
            other.removeCardProductFailureOrSuccess &&
        createOrderFailureOrSuccess == other.createOrderFailureOrSuccess;
  }

  @override
  int get hashCode {
    return updateCardProductFailureOrSuccess.hashCode ^
        removeCardProductFailureOrSuccess.hashCode ^
        createOrderFailureOrSuccess.hashCode;
  }
}
