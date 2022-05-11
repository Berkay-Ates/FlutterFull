class SharedNotInitializeException implements Exception {
  @override
  String toString() {
    return 'Shared Preferences has not initialized right now';
  }
}
