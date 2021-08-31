import 'dart:async';
import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:local_auth/local_auth.dart';

class SharedPrefService {
  final storage = FlutterSecureStorage();

  Future<String> read(String key) async {
    final val = await storage.read(key: key);
    return val != null ? jsonDecode(val) : '';
  }

  // clear storages
  Future<void> clearStorage() async {
    storage.delete(key: 'pin');
  }

  // write storage
  Future<void> write(String key, dynamic value) async {
    await storage.write(key: key, value: jsonEncode(value));
  }

  // verify passcode
  Future<void> verifyCode(String enteredCode) async {
    final pin = await read('pin');
    print(pin);
  }
}

final SharedPrefService storageService = SharedPrefService();
