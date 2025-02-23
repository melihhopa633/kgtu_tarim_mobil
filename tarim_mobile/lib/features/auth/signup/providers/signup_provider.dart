import 'package:flutter/foundation.dart';
import '../models/signup_request_model.dart';
import '../models/signup_response_model.dart';
import '../services/signup_service.dart';

class SignupProvider with ChangeNotifier {
  final SignupService _signupService = SignupService();
  bool _isLoading = false;
  String? _error;
  
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<bool> signup({
    required String userName,
    required String email,
    required String phoneNumber,
    required String password,
    required String firstName,
    required String lastName,
    required String citizenId,
    required DateTime birthDate,
    required String birthPlace,
    required String fullAddress,
  }) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final request = SignupRequestModel(
        userName: userName,
        email: email,
        phoneNumber: phoneNumber,
        password: password,
        firstName: firstName,
        lastName: lastName,
        citizenId: citizenId,
        birthDate: birthDate,
        birthPlace: birthPlace,
        fullAddress: fullAddress,
      );

      final response = await _signupService.signup(request);
      
      if (response.isSuccess) {
        _isLoading = false;
        notifyListeners();
        return true;
      } else {
        _error = response.message ?? 'Kayıt işlemi başarısız';
        _isLoading = false;
        notifyListeners();
        return false;
      }
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }
}