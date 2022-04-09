part of 'add_product_controller.dart';

class AddProductState {
  const AddProductState({
    required this.name,
    required this.description,
    required this.category,
    required this.imagePath,
    required this.price,
    required this.oldPrice,
    required this.showErrors,
    required this.addProductFailureOrSuccess,
  });

  factory AddProductState.initial() => AddProductState(
        name: NameVos(''),
        description: DescriptionVos(''),
        category: CategoryProductType.tshirts(),
        imagePath: '',
        price: 0.0,
        oldPrice: 0.0,
        showErrors: false,
        addProductFailureOrSuccess: ResultOr.none(),
      );

  final NameVos name;
  final DescriptionVos description;
  final CategoryProductType category;
  final String? imagePath;
  final double price;
  final double oldPrice;
  final bool showErrors;
  final ResultOr<FirebaseFailure> addProductFailureOrSuccess;

  AddProductState copyWith({
    NameVos? name,
    DescriptionVos? description,
    CategoryProductType? category,
    String? imagePath,
    double? price,
    double? oldPrice,
    bool? showErrors,
    ResultOr<FirebaseFailure>? addProductFailureOrSuccess,
  }) {
    return AddProductState(
      name: name ?? this.name,
      description: description ?? this.description,
      category: category ?? this.category,
      imagePath: imagePath ?? this.imagePath,
      price: price ?? this.price,
      oldPrice: oldPrice ?? this.oldPrice,
      showErrors: showErrors ?? this.showErrors,
      addProductFailureOrSuccess:
          addProductFailureOrSuccess ?? this.addProductFailureOrSuccess,
    );
  }

  @override
  String toString() {
    return '''AddProductState(
      name: $name,
      description: $description,
      category: $category,
      imagePath: $imagePath,
      price: $price,
      oldPrice: $oldPrice,
      showErrors: $showErrors,
      addProductFailureOrSuccess: $addProductFailureOrSuccess,
    )''';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AddProductState &&
        name == other.name &&
        description == other.description &&
        category == other.category &&
        imagePath == other.imagePath &&
        price == other.price &&
        oldPrice == other.oldPrice &&
        showErrors == other.showErrors &&
        addProductFailureOrSuccess == other.addProductFailureOrSuccess;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        description.hashCode ^
        category.hashCode ^
        imagePath.hashCode ^
        price.hashCode ^
        oldPrice.hashCode ^
        showErrors.hashCode ^
        addProductFailureOrSuccess.hashCode;
  }
}
