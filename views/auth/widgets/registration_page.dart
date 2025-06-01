import 'package:flutter/material.dart';
import 'package:restaurant_app/common/custom_button.dart';
import 'package:restaurant_app/constants/constants.dart';
import 'package:restaurant_app/controllers/registration_controller.dart';
import 'package:restaurant_app/models/registration_model.dart';

class RegisterPage extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();
  late final RegistrationController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              controller: usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            CustomButton(
              text: "R E G I S T E R",
              btnColor: kPrimary,
              btnRadius: 6,
              onTap: () {
                Registration model = Registration(
                  username: usernameController.text,
                  email: emailController.text,
                  password: passwordController.text,
                );

                String userdata = registrationToJson(model);

                controller.registrationFunc(userdata);
              },
            ),
          ],
        ),
      ),
    );
  }
}
