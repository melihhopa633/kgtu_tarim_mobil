import '../../../../config/api_config.dart';
import '../../../../core/services/base_api_service.dart';
import '../models/login_request_model.dart';
import '../models/login_response_model.dart';

class LoginService extends BaseApiService {
  Future<LoginResponseModel> login(String email, String password) async {
    final url = ApiConfig.baseUrl + ApiConfig.login;
    final loginRequest = LoginRequestModel(email: email, password: password);

    try {
      final responseData = await post(url, loginRequest.toJson());
      return LoginResponseModel.fromJson(responseData);
    } catch (e) {
      rethrow; // Rethrow to let the provider handle specific exceptions
    }
  }
}