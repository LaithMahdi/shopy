import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopy/controller/payment%20method/payment_method_controller.dart';
import 'package:shopy/core/constant/app_size.dart';
import 'package:shopy/core/constant/color.dart';
import 'package:shopy/data/datasource/static/card_list.dart';
import 'package:shopy/data/model/card_model.dart';
import 'package:shopy/view/widget/back_button.dart';
import 'package:shopy/view/widget/payment%20method/custom_card_payment_method.dart';

class PaymentMethodScreen extends StatelessWidget {
  const PaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PaymentMethodControllerImp controller =
        Get.put(PaymentMethodControllerImp());
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: Text("67".tr, style: Get.textTheme.displayLarge),
        backgroundColor: AppColor.primaryColorWhite,
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSize.paddingContentScreen,
        ),
        child: Column(
          children: [
            SizedBox(
              height: Get.height * 0.22,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  CardModel card = cardLists[index];
                  return CustomCardPaymentMethod(
                    numberOfCard: card.numberOfCard,
                    nameOfPersonCard: card.nameOfPersonCard,
                    dateOfCard: card.dateOfCard,
                    isSecondaryCard: card.secondCard,
                  );
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(width: AppSize.fs),
                itemCount: cardLists.length,
              ),
            ),
            Form(
              key: controller.formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "68".tr,
                      hintStyle: Get.textTheme.headlineMedium,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
