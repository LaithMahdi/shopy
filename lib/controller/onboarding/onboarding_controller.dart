import 'package:get/get.dart';
import 'package:shopy/core/constant/routes.dart';
import 'package:shopy/core/localization/changelocal.dart';
import 'package:shopy/core/services/my_services.dart';

abstract class OnboardingController extends GetxController {
  changeLanguageToEnglish();
  changeLanguageToArabic();
}

class OnboardingControllerImp extends OnboardingController {
  MyServices services = Get.find();
  LocaleController localeController = Get.find();
  @override
  changeLanguageToArabic() async {
    localeController.changeLang("ar");
    await services.sharedPreferences.setBool("onboarding", true);
    await services.sharedPreferences.setString("locale", "ar");
    Get.offNamed(AppRoute.login);
  }

  @override
  changeLanguageToEnglish() async {
    localeController.changeLang("en");
    await services.sharedPreferences.setBool("onboarding", true);
    await services.sharedPreferences.setString("locale", "ar");
    Get.offNamed(AppRoute.login);
  }
}
