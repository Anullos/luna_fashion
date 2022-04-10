part of 'localization_controller.dart';

class LocalizationState {
  const LocalizationState({
    required this.locale,
  });

  factory LocalizationState.initial() => const LocalizationState(
        locale: Locale('es', 'ES'),
      );

  final Locale locale;

  LocalizationState copyWith({
    Locale? locale,
  }) {
    return LocalizationState(
      locale: locale ?? this.locale,
    );
  }

  @override
  String toString() {
    return '''LocalizationState( locale: $locale,)''';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LocalizationState && other.locale == locale;
  }

  @override
  int get hashCode {
    return locale.hashCode;
  }
}
