import 'package:get/get.dart';
import 'package:shopy/core/constant/routes.dart';
import 'package:shopy/core/localization/changelocal.dart';
import 'package:shopy/core/services/my_services.dart';

abstract class OnboardingController extends GetxController {
  changeLanguageToEnglish();
  changeLanguageToArabic();
}

class OnboardingControllerImp extends OnboardingController {
  MyServices myServices = Get.find();
  LocaleController localeController = Get.find();
  @override
  changeLanguageToArabic() {
    localeController.changeLang("ar");
    myServices.sharedPreferences.setBool("onboarding", true);
    Get.offAllNamed(AppRoute.login);
  }

  @override
  changeLanguageToEnglish() {
    localeController.changeLang("en");
    myServices.sharedPreferences.setBool("onboarding", true);
    Get.offAllNamed(AppRoute.login);
  }
}
