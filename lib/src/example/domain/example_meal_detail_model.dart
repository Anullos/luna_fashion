import 'dart:convert';

class ExampleMealDetailModel {
  final String id;
  final String title;
  final String instructions;
  final String pictureUrl;
  final String videoUrl;
  ExampleMealDetailModel({
    required this.id,
    required this.title,
    required this.instructions,
    required this.pictureUrl,
    required this.videoUrl,
  });

  ExampleMealDetailModel copyWith({
    String? id,
    String? title,
    String? instructions,
    String? pictureUrl,
    String? videoUrl,
  }) {
    return ExampleMealDetailModel(
      id: id ?? this.id,
      title: title ?? this.title,
      instructions: instructions ?? this.instructions,
      pictureUrl: pictureUrl ?? this.pictureUrl,
      videoUrl: videoUrl ?? this.videoUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'idMeal': id,
      'strMeal': title,
      'strInstructions': instructions,
      'strMealThumb': pictureUrl,
      'strYoutube': videoUrl,
    };
  }

  factory ExampleMealDetailModel.fromMap(Map<String, dynamic> map) {
    return ExampleMealDetailModel(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      instructions: map['instructions'] ?? '',
      pictureUrl: map['pictureUrl'] ?? '',
      videoUrl: map['videoUrl'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ExampleMealDetailModel.fromJson(String source) =>
      ExampleMealDetailModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ExampleMealDetailModel(id: $id, title: $title, instructions: $instructions, pictureUrl: $pictureUrl, videoUrl: $videoUrl)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ExampleMealDetailModel &&
        other.id == id &&
        other.title == title &&
        other.instructions == instructions &&
        other.pictureUrl == pictureUrl &&
        other.videoUrl == videoUrl;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        instructions.hashCode ^
        pictureUrl.hashCode ^
        videoUrl.hashCode;
  }
}
