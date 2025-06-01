class ApiError {
  final String message;
  final int? statusCode;
  final String? error;

  ApiError({
    required this.message,
    this.statusCode,
    this.error,
  });

  factory ApiError.fromJson(Map<String, dynamic> json, [int? statusCode]) {
    return ApiError(
      message: json['message'] ?? 'Unknown error occurred',
      statusCode: statusCode,
      error: json['error'],
    );
  }

  @override
  String toString() {
    return 'ApiError: $message (Status Code: $statusCode)';
  }
}
