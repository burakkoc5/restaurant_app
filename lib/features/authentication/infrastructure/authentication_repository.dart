import 'package:data_channel/data_channel.dart';
import 'package:dio/dio.dart';
import 'package:restaurant_app/features/authentication/domain/registration_request_model.dart';
import 'package:restaurant_app/features/authentication/domain/token_model.dart';
import 'package:restaurant_app/features/authentication/infrastructure/secure_token_storage.dart';

class AuthenticationRepository {
  static const String _baseUrl = 'http://localhost:8080/api';
  final Dio _dio;
  final SecureTokenStorage _secureTokenStorage;

  AuthenticationRepository(this._dio, this._secureTokenStorage);

  Future<DC<String?, void>> login(String email, String password) async {
    print('Code is here');
    try {
      final response = await _dio.post(
        '$_baseUrl/auth/authenticate',
        data: {
          'email': email,
          'password': password,
        },
      );
      print('Data sent');
      print('Response: $response');
      if (response.statusCode == 200) {
        final token = response.data['data']['token'] as String;
        //final token = response.data['token'] as String;
        await _secureTokenStorage.write(token);
        return DC.data(token);
      }
      return DC.error('Failed to login');
    } on DioException catch (e) {
      return DC.error(e.message);
    }
  }

  Future<DC<String?, void>> createAccount(
      RegistrationRequestModel registrationRequestModel) async {
    try {
      final response = await _dio.post(
        '$_baseUrl/auth/register',
        data: registrationRequestModel.toJson(),
      );
      if (response.statusCode == 201) {
        return DC.data(null);
      }
      return DC.error('Failed to create account');
    } on DioException catch (e) {
      return DC.error(e.message);
    }
  }

  Future<DC<String?, String>> logout() async {
    print('Logging out');

    try {
      await _secureTokenStorage.delete();
      print('Repo Logged out');
      return DC.data('Logged out');
    } on DioException catch (e) {
      print('Repo Error logging out');
      return DC.error(e.message);
    }
  }

  Future<TokenModel?> getToken() async {
    final TokenModel? token = await _secureTokenStorage.read();
    print('Token is from gettoken: $token');
    return token;
  }
}
