import 'dart:convert';
import 'dart:math';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart' as box;
import 'package:restaurant_app/constants/constants.dart';
import 'package:restaurant_app/models/add_food_models.dart';
import 'package:restaurant_app/models/additives_model.dart';
import 'package:restaurant_app/models/api_error.dart';
import 'package:restaurant_app/views/home_page.dart';

class FoodController extends GetxController {
  final GetStorage _storage = GetStorage();

  // Category
  String _category = '';
  String get category => _category;
  set setCategory(String newValue) => _category = newValue;

  final RxList<String> _types = <String>[].obs;
  RxList<String> get types => _types;
  void addType(String type) => _types.add(type);
  void clearTypes() => _types.clear();

  // Tags
  final RxList<String> _tags = <String>[].obs;
  RxList<String> get tags => _tags;
  void addTag(String tag) => _tags.add(tag);
  void clearTags() => _tags.clear();

  final RxList<Additive> _additiveList = <Additive>[].obs;
  RxList<Additive> get additiveList => _additiveList;
  void addAdditive(Additive additive) => _additiveList.add(additive);
  void clearAdditives() => _additiveList.clear();

  // Image URLs
  final RxList<String> _imageUrls = <String>[].obs;
  RxList<String> get imageUrls => _imageUrls;
  void addImage(String url) => _imageUrls.add(url);
  void clearImages() => _imageUrls.clear();

  void addFoodsFunction(String data) async {
    String accessToken = await box.read('accessToken' as Uri);
  }

  // Random ID Generator for Additives
  int generateId() => Random().nextInt(10000);

  Future<void> submitFoodItem(AddFoods food) async {
    final accessToken = _storage.read('accessToken');

    if (accessToken == null) {
      Get.snackbar("Error", "Access token not found. Please log in again.");
      return;
    }

    try {
      final url = Uri.parse('$appBaseUrl/api/foods');
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken',
        },
        body: addFoodsToJson(food),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.snackbar(
          colorText: kLightWhite,
          backgroundColor: kPrimary,
          "Success",
          "Food item added successfully!",
        );
        Get.to(() => HomePage());
      } else {
        Get.snackbar(
          colorText: kLightWhite,
          backgroundColor: kPrimary,
          "Error",
          "Failed to add food. Code: ${response.statusCode}",
        );
      }
    } catch (e) {
      var data = ApiError.fromJson(jsonDecode(e.toString()));
      Get.snackbar(
        colorText: kLightWhite,
        backgroundColor: kPrimary,
        "Exception",
        "Something went wrong: $data",
      );
    }
  }
}
