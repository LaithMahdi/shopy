import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopy/core/localization/changelocal.dart';
import 'package:shopy/core/localization/translation.dart';
import 'package:shopy/core/services/my_services.dart';
import 'package:shopy/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      title: 'Shopy',
      debugShowCheckedModeBanner: false,
      translations: MyTranslation(),
      theme: controller.appTheme,
      locale: controller.language,
      getPages: routes,
    );
  }
}
