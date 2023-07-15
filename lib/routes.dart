import 'package:get/get.dart';
import 'package:shopy/core/constant/routes.dart';
import 'package:shopy/core/middleware/home_middleware.dart';
import 'package:shopy/core/middleware/onboarding_middleware.dart';
import 'package:shopy/view/screen/account/account_screen.dart';
import 'package:shopy/view/screen/authentification/forgot%20password/forgot_password.dart';
import 'package:shopy/view/screen/authentification/forgot%20password/new_password.dart';
import 'package:shopy/view/screen/authentification/forgot%20password/password_reset_successful.dart';
import 'package:shopy/view/screen/authentification/forgot%20password/recovery_code.dart';
import 'package:shopy/view/screen/authentification/sign_in.dart';
import 'package:shopy/view/screen/authentification/sign_up.dart';
import 'package:shopy/view/screen/bottom%20navigation%20bar/custom_bottom_navigation_bar.dart';
import 'package:shopy/view/screen/cart/my_cart.dart';
import 'package:shopy/view/screen/checkout/checkout_screen.dart';
import 'package:shopy/view/screen/home/home.dart';
import 'package:shopy/view/screen/onboarding/onboarding.dart';
import 'package:shopy/view/screen/payment%20method/payment_method_screen.dart';
import 'package:shopy/view/screen/splash/splash_screen.dart';
import 'package:shopy/view/screen/wishlist/wishlist_screen.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: AppRoute.splash, page: () => const SplashScreen()),
  GetPage(
      name: AppRoute.login,
      page: () => const SignInScreen(),
      middlewares: [HomeMiddleware()]),
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
  GetPage(
    name: AppRoute.bottomNavigationBar,
    page: () => CustomBottomNavigationBar(),
  ),
  GetPage(name: AppRoute.wishlist, page: () => const WishlistScreen()),
  GetPage(name: AppRoute.myCart, page: () => const MyCartScreen()),
  GetPage(name: AppRoute.checkout, page: () => const CheckoutScreen()),
  GetPage(
      name: AppRoute.paymentMethod, page: () => const PaymentMethodScreen()),
  GetPage(name: AppRoute.settings, page: () => const AccountScreen()),
];
