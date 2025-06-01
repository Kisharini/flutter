import 'dart:convert';
import 'dart:math';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:restaurant_app/constants/constants.dart';
import 'package:restaurant_app/models/api_error.dart';
import 'package:restaurant_app/models/restaurant_response.dart';
import 'package:restaurant_app/models/success_model.dart';
import 'package:restaurant_app/views/auth/widgets/login_page.dart';

class RestaurantController extends GetxController {
  final box = GetStorage();
  RestaurantResponse? restaurant;

  final RxBool _isLoading = false.obs;

  bool get isLoading => _isLoading.value;
  set isLoading(bool value) => _isLoading.value = value;

  Future<String> restaurantRegistration(String data) async {
    final String accessToken = box.read('accessToken') ?? '';
    isLoading = true;

    final Uri url = Uri.parse('$appBaseUrl/api/restaurant');

    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken',
    };

    try {
      final response = await http.post(url, headers: headers, body: data);

      if (response.statusCode == 201) {
        final success = successResponseFromJson(response.body);

        Get.snackbar(
          success.message,
          'Restaurant registered successfully. Continue to login.',
          colorText: kLightWhite,
          backgroundColor: kPrimary,
        );

        Get.offAll(
          () => LoginPage(),
          transition: kTransition,
          duration: kDuration,
        );

        return "Verified";
      } else {
        final Map<String, dynamic> errorJson = json.decode(response.body);
        final error = ApiError.fromJson(errorJson, response.statusCode);

        Get.snackbar(
          error.message,
          'Failed to register restaurant. Please try again.',
          colorText: kLightWhite,
          backgroundColor: kPrimary,
        );

        return "Error";
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Something went wrong. Please try again.\n${e.toString()}',
        colorText: kLightWhite,
        backgroundColor: kPrimary,
      );

      return "Exception"; 
    } finally {
      isLoading = false;
    }
  }

  int generateId() {
    int min = 0;
    int max = 10000;
    return min + Random().nextInt(max - min);
  }

  RestaurantResponse? loadRestaurantFromStorage() {
    try {
      String? restaurantJson = box.read("restaurantData");
      if (restaurantJson != null) {
        restaurant = RestaurantResponse.fromJson(jsonDecode(restaurantJson));
        return restaurant;
      }
    } catch (e) {
      print("Error loading restaurant data: $e");
    }
    return null;
  }
}
