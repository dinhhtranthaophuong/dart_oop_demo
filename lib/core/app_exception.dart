class AppException implements Exception {
  final String message;       // thông báo thân thiện cho người dùng
  AppException(this.message);

  @override
  String toString() => '$runtimeType: $message';
}

class ValidationException extends AppException {
  ValidationException(super.message);
}

class ParseException extends AppException {
  ParseException(super.message);
}

class NetworkException extends AppException {
  NetworkException([super.message = 'Không có kết nối mạng']);
}