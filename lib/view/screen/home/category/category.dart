import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopy/controller/home/category/category_controller.dart';
import 'package:shopy/core/class/handling_data_view.dart';
import 'package:shopy/core/constant/app_size.dart';
import 'package:shopy/core/constant/color.dart';
import 'package:shopy/data/model/category_model.dart';
import 'package:shopy/view/widget/back_button.dart';
import 'package:shopy/view/widget/home/custom_container_shoes_card.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CategoryControllerImp controller = Get.put(CategoryControllerImp());
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: Text("43".tr, style: Get.textTheme.displayLarge),
        backgroundColor: AppColor.primaryColorWhite,
        elevation: 0,
      ),
      body: ListView(
          padding: const EdgeInsets.symmetric(
              horizontal: AppSize.paddingContentScreen),
          children: [
            const SizedBox(height: AppSize.borderRaduis),
            SizedBox(
              height: Get.height * 0.05,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: controller.category.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  CategoryModel category = controller.category[index];
                  return GetBuilder<CategoryControllerImp>(
                    builder: (controller) => GestureDetector(
                      onTap: () => controller.changeCategory(category.id),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.symmetric(
                                horizontal: AppSize.fs2),
                            padding: const EdgeInsets.fromLTRB(
                                AppSize.fs, 0, AppSize.fs, 4),
                            child: Text(
                              category.categoryName,
                              style: Get.textTheme.headlineLarge!.copyWith(
                                  color: controller.selCat == category.id
                                      ? AppColor.primaryColorBlue
                                      : AppColor.primaryColorGrey4),
                            ),
                          ),
                          controller.selCat == category.id
                              ? const CircleAvatar(
                                  backgroundColor: AppColor.primaryColorBlue,
                                  maxRadius: 4,
                                )
                              : const SizedBox(),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: AppSize.borderRaduis),
            GetBuilder<CategoryControllerImp>(
              builder: (controller) => Container(
                  padding: EdgeInsets.zero,
                  height: Get.height * 0.7,
                  child: HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: GridView.builder(
                      shrinkWrap: true,
                      itemCount: controller.shoes.length,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // number of items in each row
                        mainAxisSpacing: 8.0, // spacing between rows
                        crossAxisSpacing: 8.0,
                        childAspectRatio: 0.65,
                      ),
                      itemBuilder: (context, index) {
                        return CustomContainerShoesCard(
                          shoesModel: controller.shoes[index],
                          onTapFavorite: () {},
                          onTapAdd: () {},
                        );
                      },
                    ),
                  )),
            )
          ]),
    );
  }
}
