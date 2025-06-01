import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_app/constants/constants.dart';
import 'package:restaurant_app/hooks/orders_hook.dart';
import 'package:restaurant_app/views/foods/food_list.dart';
import 'package:restaurant_app/views/widgets/order_tile.dart';

class CancelledOrders extends HookWidget{
  const CancelledOrders({super.key});

  @override
   Widget build(BuildContext context) {
    final hookResults = fetchOrders('Cancelled');
    final isLoading = hookResults.isLoading;
    final data = hookResults.data;
    final error = hookResults.error;

    if (isLoading) {
      return FoodList();
    }

    if (error != null) {
      return Center(
        child: Text(error.message),
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(15.r),
        topRight: Radius.circular(15.r),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: kGrayLight.withValues(),
        ),
        child: ListView(
          children: List.generate(data!.length, (i) {
            final order = data[i];
            return Padding(
              padding: EdgeInsets.only(bottom: 8.h),
              child: OrderTile(order: order),
            );
          }),
        ),
      ),
    );
  }
}