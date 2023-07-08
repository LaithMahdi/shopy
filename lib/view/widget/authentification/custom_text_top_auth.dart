import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shopy/core/constant/app_size.dart';

class CustomTextTopAuth extends StatelessWidget {
  final String title;
  const CustomTextTopAuth({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Get.textTheme.headlineMedium!.copyWith(
        fontWeight: FontWeight.w400,
        fontSize: 13,
        height: AppSize.textHeightSm,
      ),
    );
  }
}
