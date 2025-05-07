import 'dart:math';

import 'package:get/get.dart';
import 'package:restaurant_app/models/additives_model.dart';

class FoodController extends GetxController {
  String _category = '';
  String get category => _category;

  set setCategory(String newValue) {
    _category = newValue;
  }

  RxList<String> get _types => <String>[].obs;
  RxList<String> get types => _types;
  RxList<Additive> get _additiveList => <Additive>[].obs;
  RxList<Additive> get additiveList => _additiveList;

  set setTypes(String newValue) {
    _types;
  }

  set addAdditive(Additive newValue) {
    _additiveList.add(newValue);
  }

  void clearAdditives() {
    _additiveList.clear();
  }

  int generateId() {
    int min = 0;
    int max = 10000;

    // ignore: unused_local_variable
    final _random = Random();
    return min + Random().nextInt(max - min);
  }
}
