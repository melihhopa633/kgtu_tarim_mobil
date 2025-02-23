import 'dart:convert';
import '../../../../config/api_config.dart';
import '../../../../core/services/base_api_service.dart';
import '../models/signup_request_model.dart';
import '../models/signup_response_model.dart';

class SignupService extends BaseApiService {
  Future<SignupResponseModel> signup(SignupRequestModel request) async {
    final url = ApiConfig.baseUrl + ApiConfig.signup;

    try {
      final responseData = await post(url, request.toJson());
      return SignupResponseModel.fromJson(responseData);
    } catch (e) {
      rethrow; // Rethrow to let the provider handle specific exceptions
    }
  }
}