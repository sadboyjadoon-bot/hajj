import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'secure_key_store.dart';

final secureStorageProvider = Provider<FlutterSecureStorage>(
  (ref) => const FlutterSecureStorage(),
);

final secureKeyStoreProvider = Provider<SecureKeyStore>(
  (ref) => SecureKeyStore(ref.watch(secureStorageProvider)),
);
