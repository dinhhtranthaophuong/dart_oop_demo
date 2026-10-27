import 'app_exception.dart';
import 'result.dart';

Future<Result<T>> safeCall<T>(Future<T> Function() action) async {
  try {
    final data = await action();
    return Result.success(data);
  } on ValidationException catch (e) {
    return Result.failure('Dữ liệu chưa hợp lệ: ${e.message}');
  } on ParseException catch (e) {
    return Result.failure('Không đọc được dữ liệu: ${e.message}');
  } on AppException catch (e) {
    return Result.failure(e.message);
  } catch (e, stack) {
    // Lỗi không lường trước: ghi log kỹ thuật, báo thân thiện cho người dùng
    // ignore: avoid_print
    print('Lỗi không xác định: $e\n$stack');
    return Result.failure('Đã xảy ra lỗi không mong muốn. Vui lòng thử lại.');
  } finally {
    // ignore: avoid_print
    print('safeCall kết thúc'); // dọn dẹp / tắt loading
  }
}