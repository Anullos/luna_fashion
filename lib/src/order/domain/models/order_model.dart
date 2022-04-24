import 'package:flutter/foundation.dart';

import '../types/order_status_type.dart';
import 'product_order_model.dart';

class OrderModel {
  final String id;
  final List<ProductOrderModel> products;
  final OrderStatusType status;
  final int atCreated;
  final int atUpdated;
  OrderModel({
    required this.id,
    required this.products,
    required this.status,
    required this.atCreated,
    required this.atUpdated,
  });

  OrderModel copyWith({
    String? id,
    List<ProductOrderModel>? products,
    OrderStatusType? status,
    int? atCreated,
    int? atUpdated,
  }) {
    return OrderModel(
      id: id ?? this.id,
      products: products ?? this.products,
      status: status ?? this.status,
      atCreated: atCreated ?? this.atCreated,
      atUpdated: atUpdated ?? this.atUpdated,
    );
  }

  @override
  String toString() {
    return 'OrderModel(id: $id, products: $products, status: $status, atCreated: $atCreated, atUpdated: $atUpdated)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OrderModel &&
        other.id == id &&
        listEquals(other.products, products) &&
        other.status == status &&
        other.atCreated == atCreated &&
        other.atUpdated == atUpdated;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        products.hashCode ^
        status.hashCode ^
        atCreated.hashCode ^
        atUpdated.hashCode;
  }
}
