import 'package:flutter/material.dart';

class PhoneTextField extends StatelessWidget {
  final TextEditingController controller;

  const PhoneTextField({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: 'Phone Number',
        prefixIcon: Icon(Icons.phone),
        border: OutlineInputBorder(),
      ),
      keyboardType: TextInputType.phone,
    );
  }
}
