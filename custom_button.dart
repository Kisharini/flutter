import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_app/common/app_style.dart';
import 'package:restaurant_app/common/reusable_text.dart';
import 'package:restaurant_app/constants/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onTap,
    this.btnHeight,
    this.btnWidth,
    this.btnColor,
    this.btnRadius,
    required this.text
  });

  final VoidCallback? onTap;
  final double? btnWidth;
  final double? btnHeight;
  final Color? btnColor;
  final double? btnRadius;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: btnWidth ?? width,
        height: btnHeight ?? 28.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(btnRadius ?? 12.r),
          color: btnColor ?? kPrimary,
        ),
        child: Center(
          child: ReusableText(
            text: text,
            style: appStyle(12, kLightWhite, FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
