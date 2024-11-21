import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'onboarding_state.dart';
part 'onboarding_cubit.freezed.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingState.initial()) {
    checkOnboardingStatus();
  }

  Future<void> checkOnboardingStatus() async {
    print('Checking onboarding status');
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool? isOnboarded = sp.getBool('isOnboarded') ?? false;

    if (isOnboarded) {
      emit(state.copyWith(status: OnboardingStateStatus.completed));
    }
    print('Onboarding status is $isOnboarded');
  }

  Future<void> completeOnboarding() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.setBool('isOnboarded', true); // Onboarding durumunu kaydet
    emit(state.copyWith(status: OnboardingStateStatus.completed));
    print('Onboarding completed'); // Onboarding tamamlandığını bildir
  }

  void pageChange(int pageIndex) {
    emit(state.copyWith(pageIndex: pageIndex));
  }
}
