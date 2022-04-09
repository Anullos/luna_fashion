class IntlModel {
  final String es;
  final String en;
  IntlModel({
    required this.es,
    required this.en,
  });

  IntlModel copyWith({
    String? es,
    String? en,
  }) {
    return IntlModel(
      es: es ?? this.es,
      en: en ?? this.en,
    );
  }

  @override
  String toString() => 'IntlModel(es: $es, en: $en)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is IntlModel && other.es == es && other.en == en;
  }

  @override
  int get hashCode => es.hashCode ^ en.hashCode;
}
