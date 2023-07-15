import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class PaymentMethodController extends GetxController {
  void addCard();
  void scanCard();
}

class PaymentMethodControllerImp extends PaymentMethodController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController cardNumber;
  late TextEditingController cardHolderName;
  late TextEditingController cardExpiryDate;
  late TextEditingController cardSecurityCode;
  late TextEditingController cardCVV;
  @override
  void onInit() {
    // TODO: implement onInit
    cardNumber = TextEditingController();
    cardHolderName = TextEditingController();
    cardExpiryDate = TextEditingController();
    cardSecurityCode = TextEditingController();
    cardCVV = TextEditingController();
    super.onInit();
  }

  @override
  void addCard() {}

  @override
  void scanCard() {}
}
