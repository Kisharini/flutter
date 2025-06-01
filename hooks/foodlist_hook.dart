import 'dart:convert';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:restaurant_app/constants/constants.dart';
import 'package:restaurant_app/models/api_error.dart';
import 'package:restaurant_app/models/foods_model.dart';
import 'package:restaurant_app/models/hook_models/foodlist_results_hook.dart';

FetchFoods fetchFoodList() {
  final box = GetStorage();
  final foodList = useState<List<FoodsModel>?>(null);
  final isLoading = useState<bool>(false);
  final isError = useState<ApiError?>(null);

  Future<void> fetchData() async {
    String id = box.read("restaurantId");
    isLoading.value = true;

    try {
      final url = Uri.parse('$appBaseUrl/api/foods/restaurant-foods/$id');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        foodList.value = foodsModelFromJson(response.body);
        isError.value = null;
      } else {
        isError.value = ApiError.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      isError.value = ApiError(message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  useEffect(() {
    fetchData();
    return null;
  }, []);

  void refetch() {
    fetchData();
  }

  return FetchFoods(
    data: foodList.value,
    error: isError.value,
    isLoading: isLoading.value,
    refetch: refetch,
  );
}
