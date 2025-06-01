import 'dart:math';

import 'package:get/get.dart';
import 'package:restaurant_app/constants/constants.dart';
import 'package:http/http.dart' as http;
import 'package:restaurant_app/models/success_model.dart';
import 'package:restaurant_app/views/auth/widgets/login_page.dart';

class RegistrationController extends GetxController {
  RxBool _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  set isLoading(bool value) => _isLoading.value = value;

  int generateId() {
    int min = 0;
    int max = 10000;

    return min + Random().nextInt(max - min);
  }

  void registrationFunc(String data) async {
    isLoading = true;

    var url = Uri.parse('$appBaseUrl/register');

    Map<String, String> headers = {'Content-Type': 'application/json'};

    try {
      var response = await http.post(url, body: data, headers: headers);

      if (response.statusCode == 201) {
        var data = successResponseFromJson(response.body);

        Get.snackbar(
          'Success',
          data.message,
          backgroundColor: kPrimary,
          colorText: kLightWhite,
        );
        isLoading = false;
        Get.to(
          () => LoginPage(),
          transition: Transition.fadeIn,
          duration: const Duration(milliseconds: 900),
        );
      } else {
        var data = successResponseFromJson(response.body);
        Get.snackbar(
          'Success',
          data.message,
          backgroundColor: kPrimary,
          colorText: kLightWhite,
        );
        isLoading = false;
      }
    } catch (e) {
      isLoading = false;
      Get.snackbar(
        'Error',
        e.toString(),
        backgroundColor: kPrimary,
        colorText: kLightWhite,
      );
      isLoading = false;
    }
  }
}
