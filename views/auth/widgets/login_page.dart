import 'package:flutter/material.dart';
import 'package:restaurant_app/common/custom_button.dart';
import 'package:restaurant_app/constants/constants.dart';
import 'package:restaurant_app/controllers/login_controller.dart';
import 'package:restaurant_app/models/login_request.dart';

class LoginPage extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  late final LoginController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
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
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            CustomButton(
              btnHeight: 37,
              btnColor: kPrimary,
              text: "L O G I N",
              onTap: () {
                LoginRequest model = LoginRequest(
                  email: emailController.text,
                  password: passwordController.text,
                );

                String authData = loginRequestToJson(model);

                controller.loginFunc(authData);
              },
            ),
            TextButton(
              child: Text("Don't have an account? Register"),
              onPressed: () => Navigator.pushNamed(context, '/register'),
            ),
          ],
        ),
      ),
    );
  }
}
