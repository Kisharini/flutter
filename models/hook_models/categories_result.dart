import 'package:flutter/material.dart';
import 'package:restaurant_app/models/api_error.dart';
import 'package:restaurant_app/models/categories_model.dart';

class FetchCategories {
  final List<Categories>? data;
  final bool isLoading;
  final ApiError? error;
  final VoidCallback refetch;

  FetchCategories({
    required this.data,
    required this.error,
    required this.isLoading,
    required this.refetch
  });
}
