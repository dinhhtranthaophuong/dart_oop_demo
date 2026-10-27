import '../core/app_exception.dart';

mixin ValidationMixin {
  void requireNotEmpty(String value, String field) {
    if (value.trim().isEmpty) {
      throw ValidationException('$field không được để trống');
    }
  }

  void requirePositive(num value, String field) {
    if (value <= 0) {
      throw ValidationException('$field phải lớn hơn 0');
    }
  }
}