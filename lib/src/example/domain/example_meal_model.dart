import 'dart:convert';

class ExampleMealModel {
  final String id;
  final String title;
  final String pictureUrl;
  ExampleMealModel({
    required this.id,
    required this.title,
    required this.pictureUrl,
  });

  ExampleMealModel copyWith({
    String? id,
    String? title,
    String? pictureUrl,
  }) {
    return ExampleMealModel(
      id: id ?? this.id,
      title: title ?? this.title,
      pictureUrl: pictureUrl ?? this.pictureUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'idMeal': id,
      'strMeal': title,
      'strMealThumb': pictureUrl,
    };
  }

  factory ExampleMealModel.fromMap(Map<String, dynamic> map) {
    return ExampleMealModel(
      id: map['idMeal'] ?? '',
      title: map['strMeal'] ?? '',
      pictureUrl: map['strMealThumb'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ExampleMealModel.fromJson(String source) =>
      ExampleMealModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'ExampleMealModel(id: $id, title: $title, pictureUrl: $pictureUrl)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ExampleMealModel &&
        other.id == id &&
        other.title == title &&
        other.pictureUrl == pictureUrl;
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ pictureUrl.hashCode;
}
