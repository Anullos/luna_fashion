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
    required this.showErrorImage,
    required this.addProductFailureOrSuccess,
  });

  factory AddProductState.initial() => AddProductState(
        name: NameVos(''),
        description: DescriptionVos(''),
        category: CategoryProductType.pants(),
        imagePath: null,
        price: PriceVos(0.0),
        oldPrice: PriceVos(0.0),
        showErrors: false,
        showErrorImage: false,
        addProductFailureOrSuccess: ResultOr.none(),
      );

  final NameVos name;
  final DescriptionVos description;
  final CategoryProductType category;
  final String? imagePath;
  final PriceVos price;
  final PriceVos oldPrice;
  final bool showErrors;
  final bool showErrorImage;
  final ResultOr<FirebaseFailure> addProductFailureOrSuccess;

  AddProductState copyWith({
    NameVos? name,
    DescriptionVos? description,
    CategoryProductType? category,
    String? imagePath,
    PriceVos? price,
    PriceVos? oldPrice,
    bool? showErrors,
    bool? showErrorImage,
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
      showErrorImage: showErrorImage ?? this.showErrorImage,
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
      showErrorImage: $showErrorImage,
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
        showErrorImage == other.showErrorImage &&
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
        showErrorImage.hashCode ^
        addProductFailureOrSuccess.hashCode;
  }
}
