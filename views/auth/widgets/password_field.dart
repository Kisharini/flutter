import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/controllers/password_controller.dart';

class PasswordTextField extends StatelessWidget {
  final PasswordController controller;

  const PasswordTextField({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => TextField(
      controller: controller.textController,
      obscureText: controller.isObscured,
      decoration: InputDecoration(
        labelText: 'Password',
        prefixIcon: Icon(Icons.lock),
        border: OutlineInputBorder(),
        suffixIcon: IconButton(
          icon: Icon(
            controller.isObscured ? Icons.visibility_off : Icons.visibility,
          ),
          onPressed: controller.toggleVisibility,
        ),
      ),
    ));
  }
}
