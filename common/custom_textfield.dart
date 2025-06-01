import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_app/common/app_style.dart';
import 'package:restaurant_app/constants/constants.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    required this.maxLines,
    this.onEditingComplete,
    this.keyBoardType,
    this.controller
  });
  final String hintText;
  final Widget prefixIcon;
  final int maxLines;
  final VoidCallback? onEditingComplete;
  final TextInputType? keyBoardType;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: kDark,
      maxLines: maxLines,
      onEditingComplete: onEditingComplete,
      keyboardType: keyBoardType,
      controller: controller,
      style: appStyle(12, kDark, FontWeight.normal),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
        isDense: true,
        contentPadding: maxLines == 1 ? EdgeInsets.zero : EdgeInsets.all(6.r),
        hintStyle: appStyle(12, kGray, FontWeight.normal),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kRed, width: 0.5.w),
          borderRadius: BorderRadius.circular(12.r),
        ),

        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kPrimary, width: 0.5.w),
          borderRadius: BorderRadius.circular(12.r),
        ),

        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kRed, width: 0.5.w),
          borderRadius: BorderRadius.circular(12.r),
        ),

        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kGray, width: 0.5.w),
          borderRadius: BorderRadius.circular(12.r),
        ),

        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kPrimary, width: 0.5.w),
          borderRadius: BorderRadius.circular(12.r),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: kGray, width: 0.5.w),
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),
    );
  }
}
