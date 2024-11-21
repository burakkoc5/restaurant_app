import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/common/app_cubit.dart';
import 'package:restaurant_app/features/authentication/application/authentication_cubit.dart';
import 'package:restaurant_app/routing/app_router.gr.dart';
import 'package:restaurant_app/utils/setup_locator.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            getIt<AuthenticationCubit>().logout();
            AutoRouter.of(context).replace(const RegistrationRoute());
          },
          child: const Text('Logout'),
        ),
      ),
    );
  }
}
