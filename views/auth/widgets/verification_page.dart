import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:restaurant_app/common/custom_button.dart';
import 'package:restaurant_app/constants/constants.dart';
import 'package:restaurant_app/controllers/email_verification_controller.dart';
import 'package:restaurant_app/controllers/login_controller.dart';
import 'package:restaurant_app/models/login_response.dart';

class VerificationPage extends StatelessWidget {
  final codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final controller = Get.put(EmailVerificationController());
    final userController = Get.put(LoginController());
    OtpFieldController otpController = OtpFieldController();
    // ignore: unused_local_variable
    LoginResponse? user = userController.getUserData();

    return Scaffold(
      appBar: AppBar(title: Text('Verify Code')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Enter the verification code sent to your phone or email.',
              textAlign: TextAlign.center,
            ),
            TextField(
              controller: codeController,
              decoration: InputDecoration(labelText: 'Verification Code'),
              keyboardType: TextInputType.number,
            ),

            OTPTextField(
              controller: otpController,
              length: 6,
              width: MediaQuery.of(context).size.width,
              textFieldAlignment: MainAxisAlignment.spaceAround,
              fieldWidth: 45,
              //fieldStyle: FieldStyle.box,
              outlineBorderRadius: 15,
              style: TextStyle(fontSize: 17),
              onCompleted: (pin) {
                controller.setCode(pin);
                controller.emailVerificationFunc(pin);
              },
            ),

            SizedBox(height: 20),
            CustomButton(
              text: "V E R I F Y",
              btnColor: kPrimary,
              btnRadius: 6,
              onTap: () {
                controller.emailVerificationFunc(controller.code);
              },
            ),
          ],
        ),
      ),
    );
  }
}
