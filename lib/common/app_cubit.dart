import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:restaurant_app/features/authentication/application/authentication_cubit.dart';
import 'package:restaurant_app/features/authentication/infrastructure/secure_token_storage.dart';
import 'package:restaurant_app/features/onboarding/application/onboarding_cubit.dart';
import 'package:restaurant_app/utils/setup_locator.dart';

class AppCubit extends Cubit<AppState> {
  final AuthenticationCubit authenticationCubit;
  final OnboardingCubit onboardingCubit;

  AppCubit(this.authenticationCubit, this.onboardingCubit)
      : super(AppState(isDarkMode: false));

  void checkFirstLaunch() {
    print('Checking first launch');
    final isFirstLaunch =
        onboardingCubit.state.status != OnboardingStateStatus.completed;

    if (isFirstLaunch) {
      print('First launch detected so resetting auth state');
      getIt<SecureTokenStorage>().delete();
    }
    emit(state.copyWith(
        isFirstLaunch: isFirstLaunch,
        isAuthenticated: state.isAuthenticated,
        isDarkMode: state.isDarkMode));
  }

  // Kullanıcı oturum durumuna göre durumu güncelle
  void checkAuthStatus() {
    print('Checking auth status');
    final isAuthenticated = authenticationCubit.state is Authenticated;
    if (isAuthenticated) {
      emit(AppState(
          isFirstLaunch: state.isFirstLaunch,
          isAuthenticated: true,
          isDarkMode: state.isDarkMode));
    } else {
      emit(AppState(
          isFirstLaunch: state.isFirstLaunch,
          isAuthenticated: false,
          isDarkMode: state.isDarkMode));
    }
  }

  void toggleTheme() {
    emit(state.copyWith(isDarkMode: !state.isDarkMode));
  }
}

class AppState {
  final bool isDarkMode;
  final bool isAuthenticated;
  final bool isFirstLaunch;

  AppState({
    required this.isDarkMode,
    this.isFirstLaunch = false,
    this.isAuthenticated = false,
  });

  factory AppState.initial() => AppState(
        isDarkMode: false,
        isAuthenticated: false,
      );

  AppState copyWith({
    bool? isDarkMode,
    bool? isAuthenticated,
    bool? isFirstLaunch = false,
  }) {
    return AppState(
      isFirstLaunch: isFirstLaunch ?? this.isFirstLaunch,
      isDarkMode: isDarkMode ?? this.isDarkMode,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
    );
  }
}
