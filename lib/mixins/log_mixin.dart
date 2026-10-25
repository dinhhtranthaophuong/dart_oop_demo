mixin LogMixin {
  void logAction(String action, String objectName) {
    print('[LOG - ${DateTime.now().toIso8601String()}] $action: $objectName');
  }
}