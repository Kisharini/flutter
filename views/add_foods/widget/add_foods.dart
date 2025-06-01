import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/common/app_style.dart';
import 'package:restaurant_app/common/background_container.dart';
import 'package:restaurant_app/common/reusable_text.dart';
import 'package:restaurant_app/constants/constants.dart';
import 'package:restaurant_app/controllers/food_controller.dart';
import 'package:restaurant_app/controllers/restaurant_controller.dart';
import 'package:restaurant_app/models/add_food_models.dart';
import 'package:restaurant_app/views/widget/food_info.dart';
import 'package:restaurant_app/views/widgets/additives_info.dart';
import 'package:restaurant_app/views/widgets/all_categories.dart';
import 'package:restaurant_app/views/widgets/image_uploads.dart';

class AddFoodPage extends StatefulWidget {
  const AddFoodPage({super.key});

  @override
  State<AddFoodPage> createState() => _AddFoodPageState();
}

class _AddFoodPageState extends State<AddFoodPage> {
  final PageController _pageController = PageController();
  final TextEditingController title = TextEditingController();
  final TextEditingController description = TextEditingController();
  final TextEditingController price = TextEditingController();
  final TextEditingController preparation = TextEditingController();
  final TextEditingController types = TextEditingController();
  final TextEditingController additivePrice = TextEditingController();
  final TextEditingController additiveTitle = TextEditingController();
  final TextEditingController foodTags = TextEditingController();

  final controller = Get.put(FoodController());

  final restaurantcontroller = Get.find<RestaurantController>();

  @override
  void dispose() {
    title.dispose();
    description.dispose();
    price.dispose();
    preparation.dispose();
    types.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondary,
      appBar: AppBar(
        backgroundColor: kSecondary,
        centerTitle: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ReusableText(
              text: "Welcome to Restaurant Panel",
              style: appStyle(14, kLightWhite, FontWeight.w600),
            ),
            ReusableText(
              text: "Fill all the required info to add food items",
              style: appStyle(12, kLightWhite, FontWeight.normal),
            ),
          ],
        ),
      ),
      body: BackgroundContainer(
        child: ListView(
          children: [
            SizedBox(
              width: width,
              height: height,
              child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  ChooseCategory(
                    next:
                        () => _pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                        ),
                  ),
                  ImageUploads(
                    back:
                        () => _pageController.previousPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                        ),
                    next:
                        () => _pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                        ),
                  ),
                  FoodInfo(
                    title: title,
                    description: description,
                    price: price,
                    preparation: preparation,
                    types: types,
                    back:
                        () => _pageController.previousPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                        ),
                    next:
                        () => _pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                        ),
                  ),
                  AdditivesInfo(
                    additiveTitle: additiveTitle,
                    additivePrice: additivePrice,
                    foodTags: foodTags,
                    back:
                        () => _pageController.previousPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                        ),
                    submit: () {
                      if (title.text.isEmpty ||
                          description.text.isEmpty ||
                          price.text.isEmpty ||
                          preparation.text.isEmpty) {
                        Get.snackbar(
                          "You should fill all the fields",
                          "All fields are required to upload food items to the app",
                          colorText: kLightWhite,
                          backgroundColor: kPrimary,
                        );
                      } else {
                        AddFoods foodItem = AddFoods(
                          title: title.text,
                          foodTags: controller.tags,
                          foodType: controller.types,
                          code: restaurantcontroller.restaurant!.code,
                          category: controller.category,
                          time: preparation.text,
                          isAvailable: true,
                          restaurant: AutofillHints.organizationName,
                          description: description.text,
                          price: double.parse(price.text),
                          additives: controller.additiveList,
                          imageUrl: controller.imageUrls,
                        );

                        String data = addFoodsToJson(foodItem);
                        controller.addFoodsFunction(data);
                        controller.additiveList.clear();
                        controller.tags.clear();
                        controller.types.clear();
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
