import '../types/category_product_type.dart';

class ProductModel {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final CategoryProductType category;
  final double price;
  final double oldPrice;
  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.category,
    required this.price,
    required this.oldPrice,
  });

  ProductModel copyWith({
    String? id,
    String? name,
    String? description,
    String? imageUrl,
    CategoryProductType? category,
    double? price,
    double? oldPrice,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      category: category ?? this.category,
      price: price ?? this.price,
      oldPrice: oldPrice ?? this.oldPrice,
    );
  }

  @override
  String toString() {
    return 'ProductModel(id: $id, name: $name, description: $description, imageUrl: $imageUrl, category: $category, price: $price, oldPrice: $oldPrice)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductModel &&
        other.id == id &&
        other.name == name &&
        other.description == description &&
        other.imageUrl == imageUrl &&
        other.category == category &&
        other.price == price &&
        other.oldPrice == oldPrice;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        description.hashCode ^
        imageUrl.hashCode ^
        category.hashCode ^
        price.hashCode ^
        oldPrice.hashCode;
  }
}
