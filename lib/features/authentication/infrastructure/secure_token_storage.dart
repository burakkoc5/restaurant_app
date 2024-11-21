import 'dart:convert';

import 'package:restaurant_app/features/authentication/domain/token_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureTokenStorage {
  SecureTokenStorage(this._secureStorage);

  final FlutterSecureStorage _secureStorage;

  Future<void> delete() async {
    await _secureStorage.delete(key: 'token_storage');
    print('Token deleted');
  }

  Future<TokenModel?> read() async {
    final token = await _secureStorage.read(key: 'token_storage');

    if (token != null) {
      print('Token is ::: $token');
      return TokenModel.fromJson({
        'token': token,
        'expiryDate': DateTime.now().add(const Duration(days: 1)).toString(),
      });
    }
    print('Token is null');
    return null;
  }

  Future<void> write(String token) async {
    await _secureStorage.write(key: 'token_storage', value: jsonEncode(token));
  }
}
