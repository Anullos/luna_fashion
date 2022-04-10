import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'localization_state.dart';

class LocalizationController extends StateNotifier<LocalizationState> {
  LocalizationController() : super(LocalizationState.initial());

  Future<void> signIn() async {}

  void localeChanged(Locale locale) {
    state = state.copyWith(locale: locale);
  }
}
