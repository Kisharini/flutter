import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

String googleApiKey = '';

const kPrimary = Color(0xFF30b9b2);
const kPrimaryLight = Color(0xFF40F3EA);
const kSecondary = Color(0xFFFFA44F);
const kSecondaryLight = Color(0xFFFFe5db);
const kTertiary = Color(0xff0078a6);
const kGray = Color(0xff83829a);
const kGrayLight = Color(0xffc1c0c8);
const kLightWhite = Color(0xffFAFAFC);
const kWHite = Color(0xffffffff);
const kDark = Color(0xff000000);
const kRed = Color(0xffe81e4d);
const kOffWhite = Color(0xfff3f4f8);

double height = 926.h;
double width = 428.w;

const String appBaseUrl = "";

List<String> orderList = ["New Order", "Preparing", "Ready", "Picked Up", "Self Deliveries", "Delivered", "Cancelled"];
