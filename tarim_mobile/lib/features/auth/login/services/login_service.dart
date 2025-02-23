import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../config/api_config.dart';
import '../models/login_request_model.dart';
import '../models/login_response_model.dart';

class LoginService {
  Future<LoginResponseModel> login(String email, String password) async {
    final url = Uri.parse(ApiConfig.baseUrl + ApiConfig.login);
    final loginRequest = LoginRequestModel(email: email, password: password);

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(loginRequest.toJson()),
      );

      final responseData = json.decode(response.body);
      return LoginResponseModel.fromJson(responseData);
    } catch (e) {
      throw Exception('Login failed: ${e.toString()}');
    }
  }
}