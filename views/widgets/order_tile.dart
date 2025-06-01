import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_app/common/app_style.dart';
import 'package:restaurant_app/common/order_row_text.dart';
import 'package:restaurant_app/common/reusable_text.dart';
import 'package:restaurant_app/constants/constants.dart';
import 'package:restaurant_app/models/orders_model.dart';

class OrderTile extends StatelessWidget {
  const OrderTile({super.key, required this.order});

  final OrderModels order;

  @override
  Widget build(BuildContext context) {
    /*final location = Get.put(UserLocationController());
    final controller = Get.put(OrdersController());

    // Calculate distance from current location to restaurant
    DistanceTime distanceToRestaurant = Distance().calculateDistanceTimePrice(
      location.currentLocation.latitude,
      location.currentLocation.longitude,
      order.restaurantCoords[0],
      order.restaurantCoords[1],
      5,
      5,
    );

    // Calculate distance from restaurant to customer
    DistanceTime distanceToCustomer = Distance().calculateDistanceTimePrice(
      order.restaurantCoords[0],
      order.restaurantCoords[1],
      order.recipientCoords[0],
      order.recipientCoords[1],
      15,
      5,
    );
  */
    //double totalDistance =
        //distanceToRestaurant.distance + distanceToCustomer.distance + 2;

    return GestureDetector(
      onTap: () {
        /*controller.order = order;
        controller.setDistance = totalDistance;

        Get.to(
          () => const ActivePage(),
          transition: Transition.fadeIn,
          duration: const Duration(seconds: 2),
        );*/
      },
      
      child: ClipRRect(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8.r)),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: kLightWhite,
            borderRadius: BorderRadius.all(Radius.circular(9.r)),
          ),
          padding: const EdgeInsets.all(4),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                child: SizedBox(
                  width: 70.w,
                  height: 75.h,
                  child: Image.network(
                    order.orderItems[0].imageUrl[0],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReusableText(
                     text: order.orderItems[0].foodId.title,
                     style: appStyle(10, kGray, FontWeight.w500),
                    ),
                    OrderRowText(
                      text: "Order : ${order.id}"
                    ),
                    OrderRowText(
                      text: "${order.deliveryAddress.addressLine1}"
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 3.w),
                            margin: EdgeInsets.only(right: 2.w),
                            decoration: BoxDecoration(
                              color: Color(0xFFFFFFFFF),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 3.w),
                            margin: EdgeInsets.only(right: 2.w),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFFFFF),
                              borderRadius: BorderRadius.circular(10)),
                            child: ReusableText(text: "\$ ${order.deliveryFee}", style: appStyle(9, kGray, FontWeight.w400)),
                            ),
                            Container(
                            padding: EdgeInsets.symmetric(horizontal: 3.w),
                            margin: EdgeInsets.only(right: 2.w),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFFFFF),
                              borderRadius: BorderRadius.circular(10)),
                            child: ReusableText(text: "25 min", style: appStyle(9, kGray, FontWeight.w400)),
                            ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
