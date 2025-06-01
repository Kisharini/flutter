import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:restaurant_app/constants/constants.dart';
import 'package:restaurant_app/controllers/restaurant_controller.dart';
import 'package:restaurant_app/main.dart';
import 'package:restaurant_app/models/login_response.dart';
import 'package:restaurant_app/models/restaurant_response.dart';
import 'package:restaurant_app/models/success_model.dart';
import 'package:restaurant_app/views/auth/widgets/login_page.dart';
import 'package:restaurant_app/views/auth/widgets/restaurant_registration.dart';
import 'package:restaurant_app/views/auth/widgets/verification_page.dart';
import 'package:restaurant_app/views/auth/widgets/waiting_page.dart';
import 'package:restaurant_app/views/home_page.dart';
import 'password_controller.dart';

class LoginController extends GetxController {
  final controller = Get.put(RestaurantController());
  final box = GetStorage();
  RestaurantResponse? restaurant;

  final emailController = TextEditingController();
  final passwordController = PasswordController();

  final RxBool _isLoading = false.obs;

  bool get isLoading => _isLoading.value;
  set isLoading(bool value) => _isLoading.value = value;

  void loginFunc(String data) async {
    isLoading = true;

    var url = Uri.parse('$appBaseUrl/login');
    Map<String, String> headers = {'Content-Type': 'application/json'};

    try {
      var response = await http.post(url, body: data, headers: headers);

      if (response.statusCode == 200) {
        var data = loginResponseFromJson(response.body);

        box.write(data.id, json.encode(data));
        box.write('userId', data.id);
        box.write('accessToken', data.userToken);
        box.write('e-verification', data.verification);

        if (!data.verification) {
          Get.snackbar("Verification", "Please verify your email",
              backgroundColor: kPrimary, colorText: kLightWhite);

          Get.to(() => VerificationPage(),
              transition: kTransition, duration: kDuration);
        } else if (data.userType == 'Client') {
          defaultHome = LoginPage(); 
          Get.offAll(() => RestaurantRegistration(),
              transition: kTransition, duration: kDuration);
        } else if (data.userType == 'Vendor') {
          await getVendorInfo(data.userToken);
        }

        Get.snackbar("Successfully Logged In", "Enjoy the experience",
            backgroundColor: kPrimary, colorText: kLightWhite);
      } else {
        var data = successResponseFromJson(response.body);
        Get.snackbar("Login failed", data.message,
            backgroundColor: kPrimary, colorText: kLightWhite);
      }
    } catch (e) {
      Get.snackbar("Login failed", e.toString(),
          backgroundColor: kPrimary, colorText: kLightWhite);
    } finally {
      isLoading = false;
    }
  }

  void logout() {
    box.erase();
    defaultHome = LoginPage();
    Get.offAll(() => defaultHome,
        transition: Transition.fadeIn, duration: const Duration(milliseconds: 900));
  }

  LoginResponse? getUserData() {
    try {
      String? id = box.read(box.read('userId'));
      if (id != null) {
        return loginResponseFromJson(id);
      }
    } catch (_) {}
    return null;
  }

  Future<void> getVendorInfo(String accessToken) async {
    isLoading = true;
    var url = Uri.parse('$appBaseUrl/api/restaurant/profile');
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken',
    };

    try {
      var response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        RestaurantResponse restaurantData = RestaurantResponse.fromJson(jsonDecode(response.body));
        restaurant = restaurantData;
        controller.restaurant = restaurantData;

        box.write("restaurantId", restaurantData.code);
        box.write('verification', restaurantData.verification);
        box.write(restaurantData.code, json.encode(restaurantData));

        if (restaurantData.verification != "Verified") {
          Get.offAll(() => const WaitingPage(),
              transition: kTransition, duration: kDuration);
        } else {
          Get.offAll(() => const HomePage(),
              transition: kTransition, duration: kDuration);
        }
      } else {
        var data = successResponseFromJson(response.body);
        Get.snackbar("Oops failed", data.message,
            backgroundColor: kPrimary, colorText: kLightWhite);
      }
    } catch (e) {
      Get.snackbar("Failed to load vendor info", e.toString(),
          backgroundColor: kPrimary, colorText: kLightWhite);
    } finally {
      isLoading = false;
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
