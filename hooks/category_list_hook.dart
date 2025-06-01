import 'dart:convert';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:http/http.dart' as http;
import 'package:restaurant_app/constants/constants.dart';
import 'package:restaurant_app/models/api_error.dart';
import 'package:restaurant_app/models/categories_model.dart';
import 'package:restaurant_app/models/hook_models/categories_result.dart';

FetchCategories fetchCategories() {
  final categoriesList = useState<List<Categories>?>(null);
  final isLoading = useState<bool>(false);
  final isError = useState<ApiError?>(null);

  Future<void> fetchData() async {
    isLoading.value = true;

    try {
      final url = Uri.parse('$appBaseUrl/api/category');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        categoriesList.value = categoryModelFromJson(response.body);
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

  return FetchCategories(
    data: categoriesList.value,
    error: isError.value,
    isLoading: isLoading.value,
    refetch: refetch,
  );
}
