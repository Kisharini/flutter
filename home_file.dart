import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:restaurant_app/common/app_style.dart';
import 'package:restaurant_app/common/reusable_text.dart';
import 'package:restaurant_app/constants/constants.dart';
import 'package:restaurant_app/views/add_foods/add_foods.dart';
import 'package:restaurant_app/views/foods/food_list.dart';

class HomeFile extends StatelessWidget {
  const HomeFile({
    super.key,
    this.onTap,
    required this.text,
    required this.iconPath,
  });

  final VoidCallback? onTap;
  final String text;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Image.asset(iconPath, width: 20.w, height: 20.h),
          ReusableText(text: text, style: appStyle(11, kGray, FontWeight.w500)),
        ],
      ),
    );
  }
}

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12.w),
      padding: EdgeInsets.symmetric(horizontal: 6.w),
      height: 65.h,
      decoration: BoxDecoration(
        color: kOffWhite,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 8.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Flexible(child: HomeFile(
              onTap: () {
                Get.to(() => AddFoods(),
                transition: Transition.fadeIn,
                duration: const Duration(milliseconds: 900)
            );
              },
              text: "Add Foods",
              iconPath: "assets/icons/taco.jpg",
            )),
           Flexible(child: HomeFile(
              onTap: () {},
              text: "Wallet",
              iconPath: "assets/icons/wallet.jpg",
           )),
            Flexible (child: HomeFile(
              onTap: () {
                Get.to(() => FoodList(),
                transition: Transition.fadeIn,
                duration: const Duration(milliseconds: 900)
                );
              },
              text: "Foods",
              iconPath: "assets/icons/french_fries.jpg",
            )),
           Flexible(child: HomeFile(
              onTap: () {},
              text: "Self Deliveries",
              iconPath: "assets/icons/deliver_food.jpg",
           )),
          ],
        ),
      ),
    );
  }
}
