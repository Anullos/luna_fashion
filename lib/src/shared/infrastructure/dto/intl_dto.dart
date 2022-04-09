import 'dart:convert';

import '../../domain/models/intl_model.dart';

class IntlDto {
  final String es;
  final String en;
  IntlDto({
    required this.es,
    required this.en,
  });
  IntlDto._({
    required this.es,
    required this.en,
  });

  static IntlDto fromDomain(IntlModel domain) {
    return IntlDto._(
      es: domain.es,
      en: domain.en,
    );
  }

  IntlModel toDomain() {
    return IntlModel(
      es: es,
      en: en,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'es': es,
      'en': en,
    };
  }

  factory IntlDto.fromMap(Map<String, dynamic> map) {
    return IntlDto(
      es: map['es'] ?? '',
      en: map['en'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory IntlDto.fromJson(String source) =>
      IntlDto.fromMap(json.decode(source));
}
