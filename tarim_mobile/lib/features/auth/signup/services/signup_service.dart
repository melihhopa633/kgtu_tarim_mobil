import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../config/api_config.dart';
import '../models/signup_request_model.dart';
import '../models/signup_response_model.dart';

class SignupService {
  Future<SignupResponseModel> signup(SignupRequestModel request) async {
    final url = Uri.parse(ApiConfig.baseUrl + ApiConfig.signup);

    try {
      final response = await http.post(
        url,
        headers: ApiConfig.defaultHeaders,
        body: json.encode(request.toJson()),
      );

      final responseData = json.decode(response.body);
      return SignupResponseModel.fromJson(responseData);
    } catch (e) {
      throw Exception('Signup failed: ${e.toString()}');
    }
  }
}