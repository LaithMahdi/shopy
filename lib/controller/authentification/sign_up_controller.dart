import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SignUpController extends GetxController {}

class SignUpControllerImp extends SignUpController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  bool isShowPassword = true;
  late TextEditingController mailController;
  late TextEditingController passwordController;
  @override
  void onInit() {
    mailController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }
}
