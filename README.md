# Dart OOP & Error Handling Demo

Ứng dụng Flutter demo cho đề tài **Nền tảng OOP nâng cao & Xử lý lỗi trong Dart**.
Ứng dụng minh họa cách khởi tạo đối tượng linh hoạt (Named & Factory constructor), tái sử dụng tính năng bằng Mixin, dùng Generics cơ bản và xử lý lỗi tập trung để hiển thị thông báo thân thiện thay vì làm ứng dụng bị crash.

## Tính năng

- Module quản lý dữ liệu `Product` với **Named constructor** (`Product.empty()`, `Product.free()`) và **Factory constructor** (`Product.fromMap()`, `Product.fromJson()`).
- **Mixin** `LogMixin` (tự động in log) và `ValidationMixin` (kiểm tra tính hợp lệ của dữ liệu).
- **Generics**: `Result<T>` (kết quả thành công hoặc lỗi) và `Repository<T>`.
- **Custom Exception**: `AppException`, `ValidationException`, `ParseException`, `NetworkException`.
- Hàm wrapper `safeCall<T>()` dùng `try-catch-finally` để bắt và gom lỗi tập trung, hiển thị thông báo rõ ràng lên giao diện.

## Công nghệ

- Dart / Flutter
- Package `flutter_dotenv` (đọc biến môi trường từ file `.env`, tùy chọn)

## Cấu trúc thư mục

```
lib/
├── main.dart                  # Điểm khởi chạy và giao diện demo
├── models/
│   └── product.dart           # Model Product (Named/Factory constructor)
├── mixins/
│   ├── log_mixin.dart         # Mixin in log
│   └── validation_mixin.dart  # Mixin kiểm tra dữ liệu
├── core/
│   ├── app_exception.dart     # Custom Exception
│   ├── result.dart            # Generic Result<T>
│   ├── repository.dart        # Generic Repository<T>
│   └── error_handler.dart     # Wrapper safeCall<T>()
└── ui/
    └── home_page.dart         # Giao diện (nếu tách khỏi main.dart)
```

## Yêu cầu hệ thống

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (kiểm tra bằng `flutter doctor`)
- Android Studio hoặc VS Code
- Emulator/Simulator hoặc thiết bị thật đã bật chế độ gỡ lỗi (USB debugging)

## Cài đặt và chạy

```bash
# 1. Clone dự án
git clone https://github.com/<ten-ban>/dart_oop_demo.git
cd dart_oop_demo

# 2. Cài thư viện
flutter pub get

# 3. Kiểm tra thiết bị
flutter devices

# 4. Chạy ứng dụng
flutter run -d <device_id>
```

## Cấu hình biến môi trường (.env)

Nếu dự án dùng `.env`, sao chép file mẫu rồi chỉnh giá trị:

```bash
cp .env.example .env
```

Nội dung `.env.example`:

```
APP_NAME=Dart OOP Demo
```

> Không commit file `.env` thật lên GitHub (đã khai báo trong `.gitignore`).

Dự án này **không dùng Firebase** nên không cần file `google-services.json`. Nếu sau này tích hợp Firebase, đặt file tại `android/app/google-services.json`.

## Hướng dẫn demo

Ứng dụng có 3 nút để kiểm tra các tình huống:

| Nút | Dữ liệu đầu vào | Kết quả mong đợi |
|---|---|---|
| JSON hợp lệ | `{"id":1,"name":"Bút bi","price":5000,"quantity":10}` | Hiện thông báo thành công (nền xanh) |
| Tên rỗng | `{"id":2,"name":"","price":5000,"quantity":1}` | `ValidationException` → "Dữ liệu chưa hợp lệ: Tên sản phẩm không được để trống" |
| JSON hỏng | `{"id":"abc"` | `ParseException` → "Không đọc được dữ liệu: ..." |

Trong cả ba trường hợp ứng dụng **không bị crash**; lỗi được bắt tập trung ở `safeCall()` và hiển thị thân thiện (nền đỏ).

## Kiến thức áp dụng

- **Named constructor**: tạo đối tượng theo nhiều cách có tên rõ nghĩa.
- **Factory constructor**: chạy logic kiểm tra/chuyển đổi (Map/JSON) trước khi tạo đối tượng, có thể ném lỗi tùy biến.
- **Mixin**: tái sử dụng tính năng (log, validate) mà không cần kế thừa.
- **Generics**: `Result<T>` và `Repository<T>` dùng được cho nhiều kiểu dữ liệu.
- **try-catch-finally**: bắt lỗi từ cụ thể đến chung, `finally` luôn chạy để dọn dẹp.

## Ảnh demo

<!-- Thêm ảnh chụp màn hình hoặc GIF vào thư mục docs/ rồi chèn tại đây -->
![Demo](docs/demo.png)

## Tác giả

- Họ tên: _<py>_
- Trường: Đại học Bách khoa – Đại học Đà Nẵng
- Ngành: Kỹ thuật máy tính