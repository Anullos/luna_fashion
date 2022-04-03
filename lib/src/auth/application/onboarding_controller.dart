import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../shared/domain/failures/firebase_failure.dart';
import '../../shared/presentation/utils/result_or.dart';
import '../domain/auth_repository_interface.dart';

part 'onboarding_state.dart';

class OnBoardingController extends StateNotifier<OnBoardingState> {
  OnBoardingController(this._repository) : super(OnBoardingState.initial());

  final AuthRepositoryInterface _repository;

  Future<void> sendOnboarding() async {
    state = state.copyWith(sendOnboardingFailureOrSuccess: ResultOr.loading());
    final result = await _repository.sendOnBoarding();
    state = state.copyWith(sendOnboardingFailureOrSuccess: result);
    state = state.copyWith(sendOnboardingFailureOrSuccess: ResultOr.none());
  }
}
