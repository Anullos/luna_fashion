abstract class CategoryProductType {
  const CategoryProductType();
  factory CategoryProductType.shoes() = CategoryProductTypeShoes;
  factory CategoryProductType.tshirts() = CategoryProductTypeTshirts;
  factory CategoryProductType.pants() = CategoryProductTypePants;
  factory CategoryProductType.sweatshirts() = CategoryProductTypeSweatshirts;
  factory CategoryProductType.caps() = CategoryProductTypeCaps;
  factory CategoryProductType.dresses() = CategoryProductTypeDresses;

  void when({
    required void Function(CategoryProductTypeShoes) shoes,
    required void Function(CategoryProductTypeTshirts) tshirts,
    required void Function(CategoryProductTypePants) pants,
    required void Function(CategoryProductTypeSweatshirts) sweatshirts,
    required void Function(CategoryProductTypeCaps) caps,
    required void Function(CategoryProductTypeDresses) dresses,
  }) {
    if (this is CategoryProductTypeShoes) {
      shoes.call(this as CategoryProductTypeShoes);
    }

    if (this is CategoryProductTypeTshirts) {
      tshirts.call(this as CategoryProductTypeTshirts);
    }

    if (this is CategoryProductTypePants) {
      pants.call(this as CategoryProductTypePants);
    }

    if (this is CategoryProductTypeSweatshirts) {
      sweatshirts.call(this as CategoryProductTypeSweatshirts);
    }

    if (this is CategoryProductTypeCaps) {
      caps.call(this as CategoryProductTypeCaps);
    }

    if (this is CategoryProductTypeDresses) {
      dresses.call(this as CategoryProductTypeDresses);
    }

    shoes.call(this as CategoryProductTypeShoes);
  }

  R map<R>({
    required R Function(CategoryProductTypeShoes) shoes,
    required R Function(CategoryProductTypeTshirts) tshirts,
    required R Function(CategoryProductTypePants) pants,
    required R Function(CategoryProductTypeSweatshirts) sweatshirts,
    required R Function(CategoryProductTypeCaps) caps,
    required R Function(CategoryProductTypeDresses) dresses,
  }) {
    if (this is CategoryProductTypeShoes) {
      return shoes.call(this as CategoryProductTypeShoes);
    }

    if (this is CategoryProductTypeTshirts) {
      return tshirts.call(this as CategoryProductTypeTshirts);
    }

    if (this is CategoryProductTypePants) {
      return pants.call(this as CategoryProductTypePants);
    }

    if (this is CategoryProductTypeSweatshirts) {
      return sweatshirts.call(this as CategoryProductTypeSweatshirts);
    }

    if (this is CategoryProductTypeCaps) {
      return caps.call(this as CategoryProductTypeCaps);
    }

    if (this is CategoryProductTypeDresses) {
      return dresses.call(this as CategoryProductTypeDresses);
    }

    return shoes.call(this as CategoryProductTypeShoes);
  }

  void maybeWhen({
    void Function(CategoryProductTypeShoes)? shoes,
    void Function(CategoryProductTypeTshirts)? tshirts,
    void Function(CategoryProductTypePants)? pants,
    void Function(CategoryProductTypeSweatshirts)? sweatshirts,
    void Function(CategoryProductTypeCaps)? caps,
    void Function(CategoryProductTypeDresses)? dresses,
    required void Function() orElse,
  }) {
    if (this is CategoryProductTypeShoes && shoes != null) {
      shoes.call(this as CategoryProductTypeShoes);
    }

    if (this is CategoryProductTypeTshirts && tshirts != null) {
      tshirts.call(this as CategoryProductTypeTshirts);
    }

    if (this is CategoryProductTypePants && pants != null) {
      pants.call(this as CategoryProductTypePants);
    }

    if (this is CategoryProductTypeSweatshirts && sweatshirts != null) {
      sweatshirts.call(this as CategoryProductTypeSweatshirts);
    }

    if (this is CategoryProductTypeCaps && caps != null) {
      caps.call(this as CategoryProductTypeCaps);
    }

    if (this is CategoryProductTypeDresses && dresses != null) {
      dresses.call(this as CategoryProductTypeDresses);
    }

    orElse.call();
  }

  R maybeMap<R>({
    R Function(CategoryProductTypeShoes)? shoes,
    R Function(CategoryProductTypeTshirts)? tshirts,
    R Function(CategoryProductTypePants)? pants,
    R Function(CategoryProductTypeSweatshirts)? sweatshirts,
    R Function(CategoryProductTypeCaps)? caps,
    R Function(CategoryProductTypeDresses)? dresses,
    required R Function() orElse,
  }) {
    if (this is CategoryProductTypeShoes && shoes != null) {
      return shoes.call(this as CategoryProductTypeShoes);
    }

    if (this is CategoryProductTypeTshirts && tshirts != null) {
      return tshirts.call(this as CategoryProductTypeTshirts);
    }

    if (this is CategoryProductTypePants && pants != null) {
      return pants.call(this as CategoryProductTypePants);
    }

    if (this is CategoryProductTypeSweatshirts && sweatshirts != null) {
      return sweatshirts.call(this as CategoryProductTypeSweatshirts);
    }

    if (this is CategoryProductTypeCaps && caps != null) {
      return caps.call(this as CategoryProductTypeCaps);
    }

    if (this is CategoryProductTypeDresses && dresses != null) {
      return dresses.call(this as CategoryProductTypeDresses);
    }

    return orElse.call();
  }

  factory CategoryProductType.fromString(String value) {
    if (value == 'SHOES') {
      return CategoryProductType.shoes();
    }

    if (value == 'TSHIRTS') {
      return CategoryProductType.tshirts();
    }

    if (value == 'PANTS') {
      return CategoryProductType.pants();
    }

    if (value == 'SWEATSHIRTS') {
      return CategoryProductType.sweatshirts();
    }

    if (value == 'CAPS') {
      return CategoryProductType.caps();
    }

    if (value == 'DRESSES') {
      return CategoryProductType.dresses();
    }

    return CategoryProductType.shoes();
  }

  @override
  String toString() {
    if (this is CategoryProductTypeShoes) {
      return 'SHOES';
    }

    if (this is CategoryProductTypeTshirts) {
      return 'TSHIRTS';
    }

    if (this is CategoryProductTypePants) {
      return 'PANTS';
    }

    if (this is CategoryProductTypeSweatshirts) {
      return 'SWEATSHIRTS';
    }

    if (this is CategoryProductTypeCaps) {
      return 'CAPS';
    }

    if (this is CategoryProductTypeDresses) {
      return 'DRESSES';
    }

    return 'SHOES';
  }
}

class CategoryProductTypeShoes extends CategoryProductType {}

class CategoryProductTypeTshirts extends CategoryProductType {}

class CategoryProductTypePants extends CategoryProductType {}

class CategoryProductTypeSweatshirts extends CategoryProductType {}

class CategoryProductTypeCaps extends CategoryProductType {}

class CategoryProductTypeDresses extends CategoryProductType {}
