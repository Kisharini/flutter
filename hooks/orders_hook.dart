import 'dart:convert';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:restaurant_app/constants/constants.dart';
import 'package:restaurant_app/models/api_error.dart';
import 'package:restaurant_app/models/hook_models/orders_result.dart';
import 'package:restaurant_app/models/orders_model.dart';

FetchOrders fetchOrders(String status) {
  final box = GetStorage();
  final orderList = useState<List<OrderModels>?>(null);
  final isLoading = useState<bool>(false);
  final isError = useState<ApiError?>(null);

  Future<void> fetchData() async {
    String id = box.read("restaurantId");
    String accessToken = box.read('accessToken');
    isLoading.value = true;

    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken',
    };

    try {
      final url = Uri.parse('$appBaseUrl/api/orders/rest-orders/$id/$status');
      final response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        orderList.value = ordersModelFromJson(response.body);
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

  return FetchOrders(
    data: orderList.value,
    error: isError.value,
    isLoading: isLoading.value,
    refetch: refetch,
  );
}
