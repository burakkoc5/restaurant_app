import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:restaurant_app/common/app_cubit.dart';
import 'package:restaurant_app/features/authentication/application/authentication_cubit.dart';
import 'package:restaurant_app/features/authentication/infrastructure/authentication_repository.dart';
import 'package:restaurant_app/features/authentication/infrastructure/secure_token_storage.dart';
import 'package:restaurant_app/features/home/home_screen.dart';
import 'package:restaurant_app/features/onboarding/application/onboarding_cubit.dart';
import 'package:restaurant_app/firebase_options.dart';
import 'package:restaurant_app/i18n/strings.g.dart';
import 'package:restaurant_app/routing/app_router.gr.dart';
import 'package:restaurant_app/utils/setup_locator.dart';

import 'routing/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocaleSettings.useDeviceLocale();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppCubit>(
          create: (context) => getIt<AppCubit>()
            ..checkFirstLaunch()
            ..checkAuthStatus(), // getIt ile enjekte edilen AppCubit
        ),
        BlocProvider<OnboardingCubit>(
          create: (context) => getIt<
              OnboardingCubit>(), // getIt ile enjekte edilen OnboardingCubit
        ),
        BlocProvider<AuthenticationCubit>(
          create: (context) => getIt<
              AuthenticationCubit>(), // getIt ile enjekte edilen AuthenticationCubit
        ),
      ],
      child: BlocListener<AppCubit, AppState>(
        listener: (context, appState) {
          if (appState.isFirstLaunch) {
            _appRouter.push(OnboardingRoute());
          } else {
            if (appState.isAuthenticated) {
              _appRouter.push(const HomeRoute());
            } else {
              _appRouter.push(const RegistrationRoute());
            }
          }
        },
        child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: _appRouter.config(),
            theme: ThemeData(
              fontFamily: 'Inter',
            )),
      ),
    );
  }
}
