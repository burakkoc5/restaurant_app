import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/common/constants/app_colors.dart';
import 'package:restaurant_app/common/container_button.dart';
import 'package:restaurant_app/features/authentication/application/authentication_cubit.dart';
import 'package:restaurant_app/i18n/strings.g.dart';
import 'package:restaurant_app/routing/app_router.gr.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginScreen({super.key});

  Widget textFieldBuilder(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Email address'),
        TextField(
          controller: emailController,
          decoration: InputDecoration(
            hintText: 'Eg name@email.com',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        const SizedBox(height: 16),
        const Text('Password'),
        TextField(
          controller: passwordController,
          obscureText: true,
          decoration: InputDecoration(
            hintText: t.registration.registration.passwordHint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ],
    );
  }

  Widget forgotPasswordButton(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () => context.router.push(ForgetPasswordRoute()),
        child: Text(
          t.registration.registration.logging.forgetPassword
              .forgetPasswordButton,
          style: const TextStyle(
            color: AppColors.primaryGreen,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget loginButton(BuildContext context) {
    return AppContainerButton(
      center: Center(
        child: Text(
          t.registration.registration.login,
          style: const TextStyle(
            color: AppColors.white,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      onPressed: () => BlocProvider.of<AuthenticationCubit>(context)
          .login(emailController.text, passwordController.text),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthenticationCubit, AuthenticationState>(
        listener: (context, state) {
          if (state is AuthLoading) {
            // Show loading indicator
          } else if (state is Authenticated) {
            print('Authenticated from login screen');
            context.router.popUntilRoot();
            context.router.replace(const HomeRoute());
          } else if (state is Unauthenticated) {
            // Show error message
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textFieldBuilder(context),
              forgotPasswordButton(context),
              const SizedBox(height: 20),
              loginButton(context),
            ],
          ),
        ),
      ),
    );
  }
}
