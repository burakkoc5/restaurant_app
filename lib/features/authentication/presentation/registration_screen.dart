import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant_app/common/constants/app_colors.dart';
import 'package:restaurant_app/common/container_button.dart';
import 'package:restaurant_app/common/custom_bottom_sheet.dart';
import 'package:restaurant_app/features/authentication/presentation/dashboard_screen.dart';
import 'package:restaurant_app/i18n/strings.g.dart';

@RoutePage()
class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 80,
                ),
                SvgPicture.asset('assets/images/welcome.svg'),
                Text(
                  t.registration.welcome,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  t.registration.registerFirst,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
            const SizedBox(
              height: 80,
            ),
            Column(
              children: [
                AppContainerButton(
                  center: Center(
                    child: Text(
                      t.registration.registration.createAccount,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  onPressed: () {
                    CustomBottomSheet.show(context,
                        child: const DashboardScreen(index: 0));
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                AppContainerButton(
                  color: AppColors.lightGreen,
                  center: Center(
                    child: Text(
                      t.registration.registration.login,
                      style: const TextStyle(
                          color: AppColors.secondaryGreen,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  onPressed: () {
                    CustomBottomSheet.show(context,
                        child: const DashboardScreen(
                          index: 1,
                        ));
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  t.registration.termsAndConditions,
                  style: const TextStyle(fontSize: 12),
                  textAlign: TextAlign.center,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
