import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PasswordController extends GetxController {
  final TextEditingController textController = TextEditingController();
  final RxBool _password = true.obs;

  bool get isObscured => _password.value;

  void toggleVisibility() {
    _password.value = !_password.value;
  }

  @override
  void onClose() {
    textController.dispose();
    super.onClose();
  }
}