import 'package:get_storage/get_storage.dart';

class LocalCache {
  static bool _isInstanceCreated = false;
  static late LocalCache _instance;

  LocalCache._();

  Future<bool> init()async {
    return await GetStorage.init();
  }

  static LocalCache getInstance() {
    if (_isInstanceCreated == false) {
      _isInstanceCreated = true;
      _instance = LocalCache._();
    }
    return _instance;
  }

  final _storage = GetStorage("_local_cache");

  void put(String key, dynamic value) {
    _storage.write(key, value);
  }

  T? get<T>(String key) {
    return _storage.read<T>(key);
  }
}
