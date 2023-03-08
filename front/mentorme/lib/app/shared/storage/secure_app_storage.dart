import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'i_custom_app_storage.dart';

class SecureAppStorage extends ICustomAppStorage {
  final _storage = const FlutterSecureStorage();

  @override
  Future<void> saveKey(String key, value) async => await _storage.write(
        key: key,
        value: jsonEncode(value),
      );

  @override
  Future<void> removeKey(String key) async => await _storage.delete(key: key);

  @override
  Future<dynamic> readKey(String key) async {
    final data = await _storage.read(key: key);
    return data != null ? jsonDecode(data) : '';
  }

  @override
  Future<Map<String, String>> getAllKeys() async => await _storage.readAll();

  @override
  Future<void> deleteAllKeys() async => await _storage.deleteAll();
}
