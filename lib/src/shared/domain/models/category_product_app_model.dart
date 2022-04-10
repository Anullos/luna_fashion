import 'intl_model.dart';

class CategoryProductAppModel {
  final String id;
  final String pictureUrl;
  final IntlModel nameIntl;
  CategoryProductAppModel({
    required this.id,
    required this.pictureUrl,
    required this.nameIntl,
  });

  CategoryProductAppModel copyWith({
    String? id,
    String? pictureUrl,
    IntlModel? nameIntl,
  }) {
    return CategoryProductAppModel(
      id: id ?? this.id,
      pictureUrl: pictureUrl ?? this.pictureUrl,
      nameIntl: nameIntl ?? this.nameIntl,
    );
  }

  String getName(String languaje) {
    switch (languaje) {
      case 'es':
        return nameIntl.es;
      case 'en':
        return nameIntl.en;
      default:
        return nameIntl.es;
    }
  }

  @override
  String toString() =>
      'CategoryProductAppModel(id: $id, pictureUrl: $pictureUrl, nameIntl: $nameIntl)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CategoryProductAppModel &&
        other.id == id &&
        other.pictureUrl == pictureUrl &&
        other.nameIntl == nameIntl;
  }

  @override
  int get hashCode => id.hashCode ^ pictureUrl.hashCode ^ nameIntl.hashCode;
}
