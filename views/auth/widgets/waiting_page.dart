import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:restaurant_app/constants/constants.dart';
import 'package:restaurant_app/controllers/login_controller.dart';
import 'package:restaurant_app/controllers/restaurant_controller.dart';
import 'package:restaurant_app/common/app_style.dart';
import 'package:restaurant_app/common/custom_button.dart';
import 'package:restaurant_app/views/home_page.dart';

class WaitingPage extends StatelessWidget {
  const WaitingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    final restaurantController = Get.put(RestaurantController());
    final controller = Get.put(LoginController());
    final String id = box.read('restaurantId') ?? 'N/A';

    return Scaffold(
      backgroundColor: kPrimary,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularProgressIndicator(color: kLightWhite),
              const SizedBox(height: 30),
              Text(
                "Your restaurant is under review.",
                style: appStyle(16, kLightWhite, FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                "Restaurant ID:\n$id",
                style: appStyle(12, kLightWhite, FontWeight.w400),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              CustomButton(
                text: "Check Status",
                onTap: () async {
                  String status = await restaurantController.restaurantRegistration(id);
                  if (status == "Verified") {
                    Get.offAll(() => const HomePage());
                  } else if (status == "Error") {
                    Get.snackbar(
                      "Error",
                      "Failed to fetch status. Please try again.",
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.redAccent,
                      colorText: Colors.white,
                    );
                  } else {
                    Get.snackbar(
                      "Still Under Review",
                      "Your restaurant status is: $status",
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.orangeAccent,
                      colorText: Colors.white,
                    );
                  }
                },
              ),
              const SizedBox(height: 15),
              CustomButton(
                text: "Logout",
                btnColor: Colors.redAccent,
                onTap: () {
                  box.erase();
                  controller.logout();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
