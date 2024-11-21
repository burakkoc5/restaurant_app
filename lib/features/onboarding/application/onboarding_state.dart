part of 'onboarding_cubit.dart';

enum OnboardingStateStatus { initial, completed }

@freezed
class OnboardingState with _$OnboardingState {
  const factory OnboardingState({
    required int pageIndex,
    required OnboardingStateStatus status,
  }) = _OnboardingState;

  factory OnboardingState.initial() => const OnboardingState(
      pageIndex: 0, status: OnboardingStateStatus.initial);
}
