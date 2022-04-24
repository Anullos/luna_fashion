import '../../../shared/domain/models/product_model.dart';

class ProductOrderModel {
  final String id;
  final ProductModel product;
  final int quantity;
  ProductOrderModel({
    required this.id,
    required this.product,
    required this.quantity,
  });

  ProductOrderModel copyWith({
    String? id,
    ProductModel? product,
    int? quantity,
  }) {
    return ProductOrderModel(
      id: id ?? this.id,
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  String toString() =>
      'ProductOrderModel(id: $id, product: $product, quantity: $quantity)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductOrderModel &&
        other.id == id &&
        other.product == product &&
        other.quantity == quantity;
  }

  @override
  int get hashCode => id.hashCode ^ product.hashCode ^ quantity.hashCode;
}
