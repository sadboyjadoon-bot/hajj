import 'dart:convert';
import 'dart:math';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureKeyStore {
  SecureKeyStore(this._storage);

  static const _databaseKeyName = 'hajj_companion_database_key';
  final FlutterSecureStorage _storage;

  Future<String> getOrCreateDatabaseKey() async {
    final storedKey = await _storage.read(key: _databaseKeyName);
    if (storedKey != null && storedKey.isNotEmpty) return storedKey;

    final random = Random.secure();
    final bytes = List<int>.generate(32, (_) => random.nextInt(256));
    final key = base64UrlEncode(bytes);
    await _storage.write(key: _databaseKeyName, value: key);
    return key;
  }

  Future<void> deleteDatabaseKey() => _storage.delete(key: _databaseKeyName);
}
