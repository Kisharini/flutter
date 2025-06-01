import 'package:flutter/material.dart';
import 'package:restaurant_app/models/api_error.dart';
import 'package:restaurant_app/models/orders_model.dart';

class FetchOrders {
  final List<OrderModels>? data;
  final bool isLoading;
  final ApiError? error;
  final VoidCallback refetch;

  FetchOrders({
    required this.data,
    required this.error,
    required this.isLoading,
    required this.refetch,
  });
}

