import 'package:flutter/material.dart';
import 'core/error_handler.dart';
import 'models/product.dart';

void main() => runApp(const MaterialApp(home: HomePage()));

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? _message;
  bool _isError = false;
  bool _loading = false;

  Future<void> _run(String json) async {
    setState(() => _loading = true);
    final result = await safeCall<Product>(() async {
      final p = Product.fromJson(json);
      p.validate();
      return p;
    });
    setState(() {
      _loading = false;
      _isError = !result.isSuccess;
      _message = result.isSuccess ? 'Thành công: ${result.data}' : result.error;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Demo OOP & Xử lý lỗi')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          ElevatedButton(
            onPressed: () => _run(
                '{"id":1,"name":"Bút bi","price":5000,"quantity":10}'),
            child: const Text('JSON hợp lệ'),
          ),
          ElevatedButton(
            onPressed: () => _run('{"id":2,"name":"","price":5000,"quantity":1}'),
            child: const Text('Tên rỗng (ValidationException)'),
          ),
          ElevatedButton(
            onPressed: () => _run('{"id":"abc"'),
            child: const Text('JSON hỏng (ParseException)'),
          ),
          const SizedBox(height: 24),
          if (_loading) const CircularProgressIndicator(),
          if (_message != null)
            Card(
              color: _isError ? Colors.red.shade100 : Colors.green.shade100,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(_message!),
              ),
            ),
        ]),
      ),
    );
  }
}