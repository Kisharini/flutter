import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/common/app_style.dart';
import 'package:restaurant_app/common/custom_button.dart';
import 'package:restaurant_app/common/custom_textfield.dart';
import 'package:restaurant_app/common/reusable_text.dart';
import 'package:restaurant_app/constants/constants.dart';
import 'package:restaurant_app/controllers/food_controller.dart';
import 'package:restaurant_app/models/additives_model.dart';

class AdditivesInfo extends StatelessWidget {
  AdditivesInfo({
    super.key,
    required this.back,
    required this.submit,
    required this.additivePrice,
    required this.additiveTitle,
    required this.foodTags,
  });

  final Function back;
  final Function submit;
  final TextEditingController additivePrice;
  final TextEditingController additiveTitle;
  final TextEditingController foodTags;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FoodController());

    return SizedBox(
      height: height,
      child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16.w, top: 12.h, bottom: 12.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReusableText(
                  text: "Add Additives Info",
                  style: appStyle(16, kGray, FontWeight.w600),
                ),
                ReusableText(
                  text: "You are required to add additives info for your product if it has any",
                  style: appStyle(11, kGray, FontWeight.normal),
                ),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Column(
              children: [
                CustomTextfield(
                  controller: additiveTitle,
                  hintText: "Additives title",
                  keyBoardType: TextInputType.text,
                  prefixIcon: Icon(Icons.keyboard_capslock),
                  maxLines: 2,
                ),
                SizedBox(height: 15.h),
                CustomTextfield(
                  controller: additivePrice,
                  hintText: "Additives price",
                  prefixIcon: Icon(Icons.keyboard_capslock),
                  maxLines: 2,
                ),
              ],
            ),
          ),

          Obx(
            () => controller.additiveList.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: List.generate(
                        controller.additiveList.length,
                        (i) {
                          final item = controller.additiveList[i];
                          return Container(
                            margin: EdgeInsets.only(bottom: 8.h),
                            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
                            decoration: BoxDecoration(
                              color: kGrayLight,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ReusableText(
                                  text: item.title,
                                  style: appStyle(12, kLightWhite, FontWeight.normal),
                                ),
                                ReusableText(
                                  text: "RM ${item.price}",
                                  style: appStyle(12, kLightWhite, FontWeight.normal),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  )
                : SizedBox.shrink(),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: CustomButton(
              text: "A D D  A D D I T I V E S",
              btnColor: kSecondary,
              btnRadius: 6,
              onTap: () {
                if (additiveTitle.text.isNotEmpty && additivePrice.text.isNotEmpty) {
                   final newAdditive =  Additive(
                   id: controller.generateId(),
                   title: additiveTitle.text,
                   price: double.tryParse(additivePrice.text) ?? 0.0, 
                );
             controller.additiveList.add(newAdditive);
             additiveTitle.clear();
             additivePrice.clear();
                } else {
                  Get.snackbar(
                    "You need data to add additives",
                    "Please fill all fields",
                    backgroundColor: kPrimary,
                    colorText: kLightWhite,
                  );
                }
              },
            ),
          ),

          SizedBox(height: 30.h),

          Padding(
            padding: EdgeInsets.only(left: 16.w, top: 12.h, bottom: 12.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReusableText(
                  text: "Add Food Tags",
                  style: appStyle(16, kGray, FontWeight.w600),
                ),
                ReusableText(
                  text: "You are required to add food tags for your product if it has any",
                  style: appStyle(11, kGray, FontWeight.normal),
                ),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: CustomTextfield(
              controller: foodTags,
              hintText: "Add Food Tags",
              prefixIcon: Icon(Icons.tag),
              maxLines: 1,
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Obx(() => controller.types.isNotEmpty
                ? Wrap(
                    spacing: 6.w,
                    children: List.generate(
                      controller.tags.length,
                      (i) => Chip(
                        backgroundColor: kPrimary,
                        label: Text(
                          controller.types[i],
                          style: appStyle(10, kLightWhite, FontWeight.normal),
                        ),
                      ),
                    ),
                  )
                : SizedBox.shrink()),
          ),

          SizedBox(height: 15.h),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: CustomButton(
              text: "A D D  F O O D  T A G S",
              btnColor: kSecondary,
              btnHeight: 35,
              btnRadius: 6,
              onTap: () {
                foodTags.text = '';
              },
            ),
          ),

          SizedBox(height: 20.h),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                  text: "Back",
                  btnWidth: width / 2.3,
                  btnRadius: 9,
                  onTap: () => back(),
                ),
                CustomButton(
                  text: "Submit",
                  btnWidth: width / 2.3,
                  btnRadius: 9,
                  onTap: () => submit(),
                ),
              ],
            ),
          ),

          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
