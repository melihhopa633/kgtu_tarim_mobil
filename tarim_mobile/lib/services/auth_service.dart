import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config/api_config.dart';
import '../models/login_request.dart';
import '../models/login_response.dart';

class AuthService {
  Future<LoginResponse> login(String email, String password) async {
    final url = Uri.parse(ApiConfig.baseUrl + ApiConfig.login);
    final loginRequest = LoginRequest(email: email, password: password);

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(loginRequest.toJson()),
      );

      final responseData = json.decode(response.body);
      return LoginResponse.fromJson(responseData);
    } catch (e) {
      throw Exception('Login failed: ${e.toString()}');
    }
  }
}