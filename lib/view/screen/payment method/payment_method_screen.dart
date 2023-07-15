import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopy/controller/payment%20method/payment_method_controller.dart';
import 'package:shopy/core/constant/app_size.dart';
import 'package:shopy/core/constant/color.dart';
import 'package:shopy/data/datasource/static/card_list.dart';
import 'package:shopy/data/model/card_model.dart';
import 'package:shopy/view/widget/authentification/custom_primary_button.dart';
import 'package:shopy/view/widget/back_button.dart';
import 'package:shopy/view/widget/payment%20method/custom_card_payment_method.dart';
import 'package:shopy/view/widget/payment%20method/custom_payment_text_form_field.dart';

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
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSize.paddingContentScreen,
        ),
        child: Column(
          children: [
            const SizedBox(height: AppSize.md),
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
            const SizedBox(height: AppSize.paddingContentScreenMd),
            Form(
              key: controller.formKey,
              child: Column(
                children: [
                  CustomPaymentTextFormField(
                    labelText: "68".tr,
                    controller: controller.cardNumber,
                  ),
                  const SizedBox(height: AppSize.paddingContentScreenMd),
                  CustomPaymentTextFormField(
                    labelText: "69".tr,
                    controller: controller.cardHolderName,
                  ),
                  const SizedBox(height: AppSize.paddingContentScreenMd),
                  Row(
                    children: [
                      Expanded(
                        child: CustomPaymentTextFormField(
                          labelText: "70".tr,
                          controller: controller.cardExpiryDate,
                        ),
                      ),
                      const SizedBox(width: AppSize.buttonPadding),
                      Expanded(
                        child: CustomPaymentTextFormField(
                          labelText: "71".tr,
                          controller: controller.cardSecurityCode,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSize.paddingContentScreenMd),
                  CustomPaymentTextFormField(
                    labelText: "72".tr,
                    controller: controller.cardCVV,
                  ),
                  const SizedBox(height: AppSize.paddingContentScreen),
                  CustomPrimaryButton(
                    onPressed: () => controller.addCard(),
                    title: "75".tr,
                  ),
                  const SizedBox(height: AppSize.lg),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Expanded(
                        child: Divider(color: AppColor.primaryColorGrey2),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: AppSize.fs1),
                        child:
                            Text("73".tr, style: Get.textTheme.headlineMedium),
                      ),
                      const Expanded(
                        child: Divider(color: AppColor.primaryColorGrey2),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSize.buttonPadding),
                  CustomPrimaryButton(
                    onPressed: () => controller.scanCard(),
                    title: "74".tr,
                    color: AppColor.primaryColorGrey2,
                  ),
                  const SizedBox(height: AppSize.xlg),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
