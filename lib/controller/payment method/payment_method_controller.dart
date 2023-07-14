import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class PaymentMethodController extends GetxController {}

class PaymentMethodControllerImp extends PaymentMethodController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
}
