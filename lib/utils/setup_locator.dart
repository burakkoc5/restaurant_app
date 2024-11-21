import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:restaurant_app/common/app_cubit.dart';
import 'package:restaurant_app/features/authentication/application/authentication_cubit.dart';
import 'package:restaurant_app/features/authentication/infrastructure/authentication_repository.dart';
import 'package:restaurant_app/features/authentication/infrastructure/secure_token_storage.dart';
import 'package:restaurant_app/features/onboarding/application/onboarding_cubit.dart';

final getIt = GetIt.instance;

void setupLocator() {
  // Dio'yu Lazy Singleton olarak kaydediyoruz
  getIt.registerLazySingleton<Dio>(() => Dio());

  // flutter secure storage'ı Lazy Singleton olarak kaydediyoruz
  getIt.registerLazySingleton<FlutterSecureStorage>(
      () => const FlutterSecureStorage());

  // SecureTokenStorage sınıfını doğru şekilde kaydediyoruz,
  // burada örnek olarak FlutterSecureStorage'ı parametre olarak geçiyoruz
  getIt.registerLazySingleton<SecureTokenStorage>(
      () => SecureTokenStorage(getIt<FlutterSecureStorage>()));

  getIt.registerSingleton<AuthenticationRepository>(
    AuthenticationRepository(
      getIt<Dio>(),
      getIt<SecureTokenStorage>(),
    ),
  );
  getIt.registerSingleton<AuthenticationCubit>(
      AuthenticationCubit(getIt<AuthenticationRepository>()));

  getIt.registerFactory<OnboardingCubit>(() => OnboardingCubit());

  getIt.registerSingleton<AppCubit>(
      AppCubit(getIt<AuthenticationCubit>(), getIt<OnboardingCubit>()));
}
