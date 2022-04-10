import 'dart:convert';

import '../../domain/models/product_model.dart';
import '../../domain/types/category_product_type.dart';

class ProductDto {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final CategoryProductType category;
  final double price;
  final double oldPrice;
  ProductDto({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.category,
    required this.price,
    required this.oldPrice,
  });
  ProductDto._({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.category,
    required this.price,
    required this.oldPrice,
  });

  static ProductDto fromDomain(ProductModel domain) {
    return ProductDto._(
      id: domain.id,
      name: domain.name,
      description: domain.description,
      imageUrl: domain.imageUrl,
      category: domain.category,
      price: domain.price,
      oldPrice: domain.oldPrice,
    );
  }

  ProductModel toDomain() {
    return ProductModel(
      id: id,
      name: name,
      description: description,
      imageUrl: imageUrl,
      category: category,
      price: price,
      oldPrice: oldPrice,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'imageUrl': imageUrl,
      'category': category.toString(),
      'price': price,
      'oldPrice': oldPrice,
    };
  }

  factory ProductDto.fromMap(Map<String, dynamic> map) {
    return ProductDto(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      category: CategoryProductType.fromString(map['category']),
      price: map['price']?.toDouble() ?? 0.0,
      oldPrice: map['oldPrice']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductDto.fromJson(String source) =>
      ProductDto.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProductDto(id: $id, name: $name, description: $description, imageUrl: $imageUrl, category: $category, price: $price, oldPrice: $oldPrice)';
  }
}
