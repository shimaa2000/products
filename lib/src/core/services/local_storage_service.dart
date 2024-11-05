import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

abstract class LocalStorageService {
  Future<void> setData(String key, dynamic value);
  Future<T?> getData<T>(String key);
  Future<void> removeData(String key);
  Future<void> clear();
}

@Injectable(as: LocalStorageService)
class SecureStorageService extends LocalStorageService {
  final FlutterSecureStorage _storage;
  SecureStorageService(this._storage);

  @override
  Future<void> setData(String key, dynamic value) async {
    final jsonValue = jsonEncode(value);
    await _storage.write(key: key, value: jsonValue);
  }

  @override
  Future<void> clear() async {
    await _storage.deleteAll();
  }

  @override
  Future<T?> getData<T>(String key) async {
    final jsonValue = await _storage.read(key: key);
    if (jsonValue == null) return null;
    return jsonDecode(jsonValue);
  }

  @override
  Future<void> removeData(String key) async {
    await _storage.delete(key: key);
  }
}
