import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'home_state.dart';

class HomeController extends StateNotifier<HomeState> {
  HomeController() : super(HomeState.initial());

  Future<void> signIn() async {}

  void pageControllerChanged(int value) {
    state.pageController.jumpToPage(value);
  }

  void pageChanged(int value) {
    state = state.copyWith(
      pageIndex: value,
    );
  }
}
