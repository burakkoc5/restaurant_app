import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/common/constants/app_colors.dart';
import 'package:restaurant_app/common/container_button.dart';
import 'package:restaurant_app/features/authentication/application/authentication_cubit.dart';
import 'package:restaurant_app/features/authentication/domain/registration_request_model.dart';
import 'package:restaurant_app/i18n/strings.g.dart';
import 'package:restaurant_app/routing/app_router.gr.dart';

class CreateAccountScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  CreateAccountScreen({super.key});

  Widget textFieldBuilder(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Full Name'),
        TextField(
          controller: nameController,
          decoration: InputDecoration(
            hintText: t.registration.registration.creation.nameHint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        const SizedBox(height: 16),
        const Text('Email address'),
        TextField(
          controller: emailController,
          decoration: InputDecoration(
            hintText: t.registration.registration.emailHint,
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

  Widget registerButton(BuildContext context) {
    return AppContainerButton(
      center: Center(
        child: Text(
          t.registration.registration.creation.createButton,
          style: const TextStyle(
            color: AppColors.white,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      onPressed: () => BlocProvider.of<AuthenticationCubit>(context)
          .createAccount(RegistrationRequestModel.fromJson(
        {
          'name': nameController.text,
          'email': emailController.text,
          'password': passwordController.text,
        },
      )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthenticationCubit, AuthenticationState>(
        listener: (context, state) {
          if (state is AuthLoading) {
            print('Loading');
            // Show loading indicator
          } else if (state is Authenticated) {
            print('Authenticated');
            // Account created, navigate to home screen
          } else if (state is Unauthenticated) {
            print('Unauthenticated');
            // Show error message
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textFieldBuilder(context),
              const SizedBox(height: 20),
              registerButton(context),
            ],
          ),
        ),
      ),
    );
  }
}
