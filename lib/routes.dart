import 'package:get/get.dart';
import 'package:shopy/core/constant/routes.dart';
import 'package:shopy/core/middleware/home_middleware.dart';
import 'package:shopy/core/middleware/onboarding_middleware.dart';
import 'package:shopy/view/screen/authentification/forgot%20password/forgot_password.dart';
import 'package:shopy/view/screen/authentification/forgot%20password/new_password.dart';
import 'package:shopy/view/screen/authentification/forgot%20password/password_reset_successful.dart';
import 'package:shopy/view/screen/authentification/forgot%20password/recovery_code.dart';
import 'package:shopy/view/screen/authentification/sign_in.dart';
import 'package:shopy/view/screen/authentification/sign_up.dart';
import 'package:shopy/view/screen/home/home.dart';
import 'package:shopy/view/screen/onboarding/onboarding.dart';
import 'package:shopy/view/screen/splash/splash_screen.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: AppRoute.splash, page: () => const SplashScreen()),
  GetPage(name: AppRoute.login, page: () => const SignInScreen(), middlewares: [
    HomeMiddleware(),
  ]),
  GetPage(
      name: AppRoute.onboarding,
      page: () => const OnboardingScreen(),
      middlewares: [OnboardingMiddleware()]),
  GetPage(name: AppRoute.signUp, page: () => const SignUpScreen()),
  GetPage(
      name: AppRoute.forgotPassword, page: () => const ForgotPasswordScreen()),
  GetPage(name: AppRoute.recoveryCode, page: () => const RecoveryCodeScreen()),
  GetPage(name: AppRoute.newPassword, page: () => const NewPasswordScreen()),
  GetPage(
    name: AppRoute.passwordResetSuccessful,
    page: () => const PasswordResetSuccessfulScreen(),
  ),
  GetPage(name: AppRoute.home, page: () => const HomeScreen()),
];
