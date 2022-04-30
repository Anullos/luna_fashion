import 'dart:convert';

import '../../domain/models/order_model.dart';
import '../../domain/types/order_status_type.dart';
import 'product_order_dto.dart';

class OrderDto {
  final String id;
  final String userId;
  final String userFullName;
  final List<ProductOrderDto> products;
  final OrderStatusType status;
  final int atCreated;
  final int atUpdated;
  OrderDto({
    required this.id,
    required this.userId,
    required this.userFullName,
    required this.products,
    required this.status,
    required this.atCreated,
    required this.atUpdated,
  });
  OrderDto._({
    required this.id,
    required this.userId,
    required this.userFullName,
    required this.products,
    required this.status,
    required this.atCreated,
    required this.atUpdated,
  });

  static OrderDto fromDomain(OrderModel domain) {
    return OrderDto._(
      id: domain.id,
      userId: domain.userId,
      userFullName: domain.userFullName,
      products:
          domain.products.map((e) => ProductOrderDto.fromDomain(e)).toList(),
      status: domain.status,
      atCreated: domain.atCreated,
      atUpdated: domain.atUpdated,
    );
  }

  OrderModel toDomain() {
    return OrderModel(
      id: id,
      userId: userId,
      userFullName: userFullName,
      products: products.map((e) => e.toDomain()).toList(),
      status: status,
      atCreated: atCreated,
      atUpdated: atUpdated,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'userFullName': userFullName,
      'products': products.map((x) => x.toMap()).toList(),
      'status': status.toString(),
      'atCreated': atCreated,
      'atUpdated': atUpdated,
    };
  }

  factory OrderDto.fromMap(Map<String, dynamic> map) {
    return OrderDto(
      id: map['id'] ?? '',
      userId: map['userId'] ?? '',
      userFullName: map['userFullName'] ?? '',
      products: List<ProductOrderDto>.from(
          map['products']?.map((x) => ProductOrderDto.fromMap(x))),
      status: OrderStatusType.fromString(map['status']),
      atCreated: map['atCreated']?.toInt() ?? 0,
      atUpdated: map['atUpdated']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderDto.fromJson(String source) =>
      OrderDto.fromMap(json.decode(source));
}
