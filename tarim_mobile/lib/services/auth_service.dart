import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config/api_config.dart';
import '../core/exceptions/api_exception.dart';
import '../models/login_request.dart';
import '../models/login_response.dart';

class AuthService {
  Future<LoginResponse> login(String email, String password) async {
    final url = Uri.parse(ApiConfig.baseUrl + ApiConfig.login);
    final loginRequest = LoginRequest(email: email, password: password);

    try {
      final response = await http.post(
        url,
        headers: ApiConfig.defaultHeaders,
        body: json.encode(loginRequest.toJson()),
      ).timeout(ApiConfig.timeoutDuration);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        final responseData = json.decode(response.body);
        return LoginResponse.fromJson(responseData);
      } else if (response.statusCode == 401) {
        throw UnauthorizedException('Invalid credentials');
      } else if (response.statusCode >= 400 && response.statusCode < 500) {
        final responseData = json.decode(response.body);
        throw ValidationException(
          message: responseData['message'] ?? 'Validation error',
          data: responseData['errors'],
        );
      } else if (response.statusCode >= 500) {
        throw ServerException('Server error occurred');
      } else {
        throw ApiException('Unexpected error occurred');
      }
    } on http.ClientException {
      throw NetworkException('Network connection error');
    } catch (e) {
      if (e is UnauthorizedException || 
          e is ValidationException || 
          e is ServerException ||
          e is NetworkException) {
        rethrow;
      }
      throw ApiException('An unexpected error occurred: ${e.toString()}');
    }
  }
}