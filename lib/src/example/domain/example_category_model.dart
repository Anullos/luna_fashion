import 'dart:convert';

class ExampleCategoryModel {
  final String id;
  final String title;
  final String pictureUrl;
  final String description;
  ExampleCategoryModel({
    required this.id,
    required this.title,
    required this.pictureUrl,
    required this.description,
  });

  ExampleCategoryModel copyWith({
    String? id,
    String? title,
    String? pictureUrl,
    String? description,
  }) {
    return ExampleCategoryModel(
      id: id ?? this.id,
      title: title ?? this.title,
      pictureUrl: pictureUrl ?? this.pictureUrl,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'idCategory': id,
      'strCategory': title,
      'strCategoryThumb': pictureUrl,
      'strCategoryDescription': description,
    };
  }

  factory ExampleCategoryModel.fromMap(Map<String, dynamic> map) {
    return ExampleCategoryModel(
      id: map['idCategory'] ?? '',
      title: map['strCategory'] ?? '',
      pictureUrl: map['strCategoryThumb'] ?? '',
      description: map['strCategoryDescription'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ExampleCategoryModel.fromJson(String source) =>
      ExampleCategoryModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ExampleCategoryModel(id: $id, title: $title, pictureUrl: $pictureUrl, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ExampleCategoryModel &&
        other.id == id &&
        other.title == title &&
        other.pictureUrl == pictureUrl &&
        other.description == description;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        pictureUrl.hashCode ^
        description.hashCode;
  }
}
