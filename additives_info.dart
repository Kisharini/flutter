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
  const AdditivesInfo({
    super.key,
    required this.back,
    required this.next,
    required this.additivePrice,
    required this.additiveTitle
  });

  final Function back;
  final Function next;
  final TextEditingController additivePrice;
  final TextEditingController additiveTitle;

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
          SizedBox(
            height: height*0.8,
          child: Padding(padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Column(
              children: [
                SizedBox(
                  height: 25.h,
                ),
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
                Obx(( )=>
                 controller.additiveList.isNotEmpty
                          ? Column(
                              children: List.generate(controller.additiveList.length, (
                                i,
                              ) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                                    decoration: BoxDecoration(
                                      color: kGrayLight,
                                      borderRadius: BorderRadius.circular(8.r),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        ReusableText(text: controller.additiveList[i].title, style: appStyle(11, kLightWhite, FontWeight.normal)),
                                        ReusableText(text: "\$ ${controller.additiveList[i].price}", style: appStyle(11, kLightWhite, FontWeight.normal))
                                      ],
                                    ),),
                              );
                              }),
                            )
                          : const SizedBox.shrink(),),
                SizedBox(height: 15.h),
                CustomButton(
                  text: "A D D  A D D I T I V E S",
                  btnColor: kSecondary,
                  btnRadius: 6,
                  onTap: () {
                    if (additivePrice.text.isNotEmpty && additiveTitle.text.isNotEmpty){
                      Additive additive = Additive(
                        id : controller.generateId(), title: additiveTitle.text, price: additivePrice.text
                      );
                      controller.additiveList.add(additive);
                      additivePrice.text = '';
                      additiveTitle.text = '';
                    }else {
                      Get.snackbar(colorText: kLightWhite, backgroundColor: kPrimary, "You need data to add additives","Please fill all fields");
                    }
                  },
                ),
                SizedBox(height: 30.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButton(
                      text: "Back",
                      btnWidth: width / 2.3,
                      btnRadius: 9,
                      onTap: back(),
                    ),
                    CustomButton(
                      text: "Next",
                      btnWidth: width / 2.3,
                      btnRadius: 9,
                      onTap: () => next(),
                    ),
                  ],
                ),
              ],
            ),
          ),
      )],
      ),
    );
  }
}
