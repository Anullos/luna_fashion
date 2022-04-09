part of 'home_controller.dart';

class HomeState {
  const HomeState({
    required this.pageController,
    required this.pageIndex,
  });

  factory HomeState.initial() => HomeState(
        pageController: PageController(initialPage: 0),
        pageIndex: 0,
      );

  final PageController pageController;
  final int pageIndex;

  HomeState copyWith({
    PageController? pageController,
    int? pageIndex,
  }) {
    return HomeState(
      pageController: pageController ?? this.pageController,
      pageIndex: pageIndex ?? this.pageIndex,
    );
  }

  @override
  String toString() {
    return '''HomeState( pageIndex: $pageIndex,)''';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is HomeState &&
        other.pageController == pageController &&
        other.pageIndex == pageIndex;
  }

  @override
  int get hashCode {
    return pageController.hashCode ^ pageIndex.hashCode;
  }
}
