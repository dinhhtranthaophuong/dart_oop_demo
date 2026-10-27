mixin LogMixin {
  void log(String message) {
    final time = DateTime.now().toIso8601String();
    // ignore: avoid_print
    print('[$time] [$runtimeType] $message');
  }
}