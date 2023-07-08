import 'package:get/get.dart';
import 'package:shopy/core/constant/routes.dart';
import 'package:shopy/core/middleware/onboarding_middleware.dart';
import 'package:shopy/view/screen/authentification/forgot_password.dart';
import 'package:shopy/view/screen/authentification/sign_in.dart';
import 'package:shopy/view/screen/authentification/sign_up.dart';
import 'package:shopy/view/screen/onboarding/onboarding.dart';
import 'package:shopy/view/screen/splash/splash_screen.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: AppRoute.splash, page: () => const SplashScreen()),
  GetPage(name: AppRoute.login, page: () => const SignInScreen()),
  GetPage(
      name: AppRoute.onboarding,
      page: () => const OnboardingScreen(),
      middlewares: [
        OnboardingMiddleware(),
      ]),
  GetPage(name: AppRoute.signUp, page: () => const SignUpScreen()),
  GetPage(
      name: AppRoute.forgotPassword, page: () => const ForgotPasswordScreen()),
];
