part of 'onboarding_controller.dart';

class OnBoardingState {
  const OnBoardingState({
    required this.sendOnboardingFailureOrSuccess,
  });

  factory OnBoardingState.initial() => OnBoardingState(
        sendOnboardingFailureOrSuccess: ResultOr.none(),
      );

  final ResultOr<FirebaseFailure> sendOnboardingFailureOrSuccess;

  OnBoardingState copyWith({
    ResultOr<FirebaseFailure>? sendOnboardingFailureOrSuccess,
  }) {
    return OnBoardingState(
      sendOnboardingFailureOrSuccess:
          sendOnboardingFailureOrSuccess ?? this.sendOnboardingFailureOrSuccess,
    );
  }

  @override
  String toString() {
    return '''OnBoardingState(sendOnboardingFailureOrSuccess: $sendOnboardingFailureOrSuccess)''';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OnBoardingState &&
        other.sendOnboardingFailureOrSuccess == sendOnboardingFailureOrSuccess;
  }

  @override
  int get hashCode {
    return sendOnboardingFailureOrSuccess.hashCode;
  }
}
