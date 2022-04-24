import 'dart:convert';

import '../../../shared/infrastructure/dto/product_dto.dart';
import '../../domain/models/product_order_model.dart';

class ProductOrderDto {
  final String id;
  final ProductDto product;
  final int quantity;
  ProductOrderDto({
    required this.id,
    required this.product,
    required this.quantity,
  });
  ProductOrderDto._({
    required this.id,
    required this.product,
    required this.quantity,
  });

  static ProductOrderDto fromDomain(ProductOrderModel domain) {
    return ProductOrderDto._(
      id: domain.id,
      product: ProductDto.fromDomain(domain.product),
      quantity: domain.quantity,
    );
  }

  ProductOrderModel toDomain() {
    return ProductOrderModel(
      id: id,
      product: product.toDomain(),
      quantity: quantity,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'product': product.toMap(),
      'quantity': quantity,
    };
  }

  factory ProductOrderDto.fromMap(Map<String, dynamic> map) {
    return ProductOrderDto(
      id: map['id'] ?? '',
      product: ProductDto.fromMap(map['product']),
      quantity: map['quantity']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductOrderDto.fromJson(String source) =>
      ProductOrderDto.fromMap(json.decode(source));
}
