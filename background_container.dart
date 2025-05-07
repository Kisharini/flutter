import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_app/constants/constants.dart';

class BackgroundContainer extends StatelessWidget {
  const BackgroundContainer({super.key, required this.child, this.color});
  final color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
     return ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
    child: Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color ?? kLightWhite,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
        image: DecorationImage(image: AssetImage('assets/images/restaurant_bk.png'), fit: BoxFit.cover)
      ),
      child: child,
     ));
  }
}
