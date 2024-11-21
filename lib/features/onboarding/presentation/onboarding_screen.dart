import 'package:auto_route/auto_route.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant_app/features/onboarding/application/onboarding_cubit.dart';
import 'package:restaurant_app/i18n/strings.g.dart';
import 'package:restaurant_app/routing/app_router.gr.dart';

@RoutePage()
class OnboardingScreen extends StatelessWidget {
  final PageController controller = PageController(initialPage: 0);

  OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<OnboardingCubit, OnboardingState>(
        builder: (context, state) {
          return Stack(
            alignment: Alignment.center,
            children: [
              PageView(
                controller: controller,
                onPageChanged: (value) {
                  context.read<OnboardingCubit>().pageChange(value);
                },
                children: [
                  _page(
                      context: context,
                      pageIndex: 0,
                      imageUrl: 'assets/images/onboarding_1.svg',
                      title: t.onboarding.firstPage.title,
                      desc: t.onboarding.firstPage.description),
                  _page(
                    context: context,
                    pageIndex: 1,
                    imageUrl: 'assets/images/onboarding_2.svg',
                    title: t.onboarding.secondPage.title,
                    desc: t.onboarding.secondPage.description,
                  ),
                  _page(
                    context: context,
                    pageIndex: 2,
                    imageUrl: 'assets/images/onboarding_3.svg',
                    title: t.onboarding.thirdPage.title,
                    desc: t.onboarding.thirdPage.description,
                  ),
                ],
              ),
              Positioned(
                left: 24,
                right: 24,
                bottom: 44,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Visibility(
                      maintainState: true,
                      maintainAnimation: true,
                      maintainSize: true,
                      visible: state.pageIndex !=
                          2, // don't show on page with index 2 (last page)
                      child: GestureDetector(
                        onTap: () {
                          context.read<OnboardingCubit>().completeOnboarding();
                          AutoRouter.of(context)
                              .replace(const RegistrationRoute());
                        },
                        child: const Text(
                          'Skip',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                    DotsIndicator(
                      dotsCount: 3,
                      position: state.pageIndex,
                      decorator: DotsDecorator(
                        color: Colors.grey.withOpacity(0.5),
                        activeColor: Colors.green,
                        size: const Size.square(9.0),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (state.pageIndex == 2) {
                          context.read<OnboardingCubit>().completeOnboarding();
                          AutoRouter.of(context)
                              .replace(const RegistrationRoute());
                        } else {
                          controller.animateToPage(
                            state.pageIndex + 1,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.decelerate,
                          );
                        }
                      },
                      child: Container(
                        width: 60,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _page({
    required pageIndex,
    required imageUrl,
    required title,
    required desc,
    required BuildContext context,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: SvgPicture.asset(imageUrl),
        ),
        const SizedBox(height: 80),
        Text(
          title,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 40,
          ),
          child: Text(
            desc,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12),
          ),
        ),
        const SizedBox(height: 120),
      ],
    );
  }
}
