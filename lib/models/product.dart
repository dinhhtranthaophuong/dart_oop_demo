import 'dart:convert';
import '../mixins/log_mixin.dart';
import '../mixins/validation_mixin.dart';

class Product with ValidationMixin, LogMixin {
  final String id;
  final String name;
  final double price;
  final int quantity;

  // 1. Constructor mặc định
  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.quantity,
  }) {
    // Sử dụng hàm từ LogMixin khi khởi tạo thành công
    logAction('Tạo mới Product', name);
  }

  // 2. Named constructor: Khởi tạo một sản phẩm trống/mặc định
  Product.empty()
      : id = '0',
        name = 'Unknown',
        price = 0.0,
        quantity = 0;

  // 3. Factory constructor: Chuyển đổi dữ liệu từ Map (ví dụ từ JSON)
  factory Product.fromJson(Map<String, dynamic> json) {
    // Lưu ý: Phần bắt lỗi parse (nếu thiếu key, sai kiểu dữ liệu) sẽ được 
    // xử lý nâng cao ở Bước 3. Ở đây ta thực hiện parse cơ bản.
    return Product(
      id: json['id'].toString(),
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      quantity: json['quantity'] as int,
    );
  }

  // Hàm kiểm tra hợp lệ sử dụng ValidationMixin
  bool validate() {
    return isValidPrice(price) && isValidQuantity(quantity);
  }

  @override
  String toString() => 'Product(id: $id, name: $name, price: $price, qty: $quantity)';
}