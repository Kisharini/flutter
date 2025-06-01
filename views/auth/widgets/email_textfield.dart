import 'package:flutter/material.dart';

class EmailTextField extends StatelessWidget {
  final TextEditingController controller;

  const EmailTextField({Key? key, required this.controller, required String hintText, required Icon prefixIcon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: 'Email',
        prefixIcon: Icon(Icons.email),
        border: OutlineInputBorder(),
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }
}
