import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_app/common/app_style.dart';
import 'package:restaurant_app/common/custom_button.dart';
import 'package:restaurant_app/common/reusable_text.dart';
import 'package:restaurant_app/constants/constants.dart';
import 'package:restaurant_app/controllers/food_controller.dart';
import 'package:restaurant_app/controllers/uploader_controller.dart';

class ImageUploads extends StatelessWidget {
  ImageUploads({super.key, required this.back, required this.next});

  final Function back;
  final Function next;
  final FoodController foodController = Get.put(FoodController());
  final UploaderController uploaderController = Get.put(UploaderController());

  @override
  Widget build(BuildContext context) {
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
                  text: "Upload images",
                  style: appStyle(16, kGray, FontWeight.w600),
                ),
                ReusableText(
                  text:
                      "You are required to upload at least 2 images to proceed",
                  style: appStyle(11, kGray, FontWeight.normal),
                ),
              ],
            ),
          ),
          SizedBox(
            height: height * 0.8,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Column(
                children: [
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => uploaderController.pickImage('one'),
                        child: Obx(
                          () => Container(
                            height: 120.h,
                            width: width / 2.3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              border: Border.all(color: kGrayLight),
                            ),
                            child:
                                uploaderController.imageOneUrl.value == ''
                                    ? Center(
                                      child: ReusableText(
                                        text: "Upload Image",
                                        style: appStyle(
                                          16,
                                          kDark,
                                          FontWeight.w600,
                                        ),
                                      ),
                                    )
                                    : ClipRRect(
                                      borderRadius: BorderRadius.circular(10.r),
                                      child: Image.network(
                                        uploaderController.imageOneUrl.value,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => uploaderController.pickImage('two'),
                        child: Obx(
                          () => Container(
                            height: 120.h,
                            width: width / 2.3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              border: Border.all(color: kGrayLight),
                            ),
                            child:
                                uploaderController.imageTwoUrl.value == ''
                                    ? Center(
                                      child: ReusableText(
                                        text: "Upload Image",
                                        style: appStyle(
                                          16,
                                          kDark,
                                          FontWeight.w600,
                                        ),
                                      ),
                                    )
                                    : ClipRRect(
                                      borderRadius: BorderRadius.circular(10.r),
                                      child: Image.network(
                                        uploaderController.imageTwoUrl.value,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 25.h),
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
                        onTap: () {
                          if (uploaderController.images.length > 1) {
                            next();
                          } else {
                            Get.snackbar(
                              colorText: kLightWhite,
                              backgroundColor: kPrimary,
                              snackPosition: SnackPosition.TOP,
                              "Upload required images",
                              "Please upload at least 3 images",
                            );
                          }
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          uploaderController.pickImage('three');
                        },
                        child: Obx(
                          () => Container(
                            height: 120.h,
                            width: width / 2.3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              border: Border.all(color: kGrayLight),
                            ),
                            child:
                                uploaderController.imageThreeUrl == ''
                                    ? Center(
                                      child: ReusableText(
                                        text: "Upload Image 3",
                                        style: appStyle(
                                          16,
                                          kDark,
                                          FontWeight.w600,
                                        ),
                                      ),
                                    )
                                    : ClipRRect(
                                      borderRadius: BorderRadius.circular(10.r),
                                      child: Image.network(
                                        uploaderController.imageThreeUrl,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          uploaderController.pickImage('four');
                        },
                        child: Obx(
                          () => Container(
                            height: 120.h,
                            width: width / 2.3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              border: Border.all(color: kGrayLight),
                            ),
                            child:
                                uploaderController.imageFourUrl == ''
                                    ? Center(
                                      child: ReusableText(
                                        text: "Upload Image 4",
                                        style: appStyle(
                                          16,
                                          kDark,
                                          FontWeight.w600,
                                        ),
                                      ),
                                    )
                                    : ClipRRect(
                                      borderRadius: BorderRadius.circular(10.r),
                                      child: Image.network(
                                        uploaderController.imageFourUrl,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 12.h),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          uploaderController.pickImage('logo');
                        },
                        child: Obx(
                          () => Container(
                            height: 120.h,
                            width: width / 2.3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              border: Border.all(color: kGrayLight),
                            ),
                            child:
                                uploaderController.logoUrl == ''
                                    ? Center(
                                      child: ReusableText(
                                        text: "Upload Logo",
                                        style: appStyle(
                                          16,
                                          kDark,
                                          FontWeight.w600,
                                        ),
                                      ),
                                    )
                                    : ClipRRect(
                                      borderRadius: BorderRadius.circular(10.r),
                                      child: Image.network(
                                        uploaderController.logoUrl,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          uploaderController.pickImage('cover');
                        },
                        child: Obx(
                          () => Container(
                            height: 120.h,
                            width: width / 2.3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              border: Border.all(color: kGrayLight),
                            ),
                            child:
                                uploaderController.coverUrl == ''
                                    ? Center(
                                      child: ReusableText(
                                        text: "Upload Cover",
                                        style: appStyle(
                                          16,
                                          kDark,
                                          FontWeight.w600,
                                        ),
                                      ),
                                    )
                                    : ClipRRect(
                                      borderRadius: BorderRadius.circular(10.r),
                                      child: Image.network(
                                        uploaderController.coverUrl,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

extension on String {
  get value => null;
}
