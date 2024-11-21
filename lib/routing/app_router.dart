import 'package:auto_route/auto_route.dart';
import 'package:restaurant_app/routing/app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: RegistrationRoute.page, initial: true),
        AutoRoute(page: OnboardingRoute.page),
        AutoRoute(page: ForgetPasswordRoute.page),
        AutoRoute(page: ProfileRoute.page),
        AutoRoute(page: HomeRoute.page),
      ];
}
