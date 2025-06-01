import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_app/common/app_style.dart';
import 'package:restaurant_app/common/background_container.dart';
import 'package:restaurant_app/common/reusable_text.dart';
import 'package:restaurant_app/constants/constants.dart';
import 'package:restaurant_app/hooks/foodlist_hook.dart';
import 'package:restaurant_app/views/widget/food_tile.dart';

class FoodList extends HookWidget {
  const FoodList({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResult = fetchFoodList();
    final foods = hookResult.data;
    final isLoading = hookResult.isLoading;
    final error = hookResult.error;

    if (isLoading) {
      return Scaffold(
         backgroundColor: kSecondary,
         appBar: AppBar(
         backgroundColor: kSecondary,
         title: ReusableText(
          text: "Food List",
          style: appStyle(18, kLightWhite, FontWeight.w600),
        ),
      ),
        body: BackgroundContainer(child: const FoodList()),
      );
    }

    if (error != null) {
      return Center(child: Text(error.message));
    }
    return Scaffold(
      backgroundColor: kSecondary,
      appBar: AppBar(
        backgroundColor: kSecondary,
        title: ReusableText(
          text: "Food List",
          style: appStyle(18, kLightWhite, FontWeight.w600),
        ),
      ),

      body: BackgroundContainer(
        child: Padding(
          padding: EdgeInsets.only(top: 20.h),
          child: ListView.builder(
            itemCount: foods!.length,
            itemBuilder: (context, i) {
              final food = foods[i];
              return FoodTile(food: food);
            },
          ),
        ),
      ),
    );
  }
}
