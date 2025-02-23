import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/exceptions/api_exception.dart';
import '../services/signup_service.dart';
import '../models/signup_request_model.dart';

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
        _error = response.message ?? 'Kayıt başarısız';
        _isLoading = false;
        notifyListeners();
        return false;
      }
    } on UnauthorizedException catch (e) {
      _error = e.message;
    } on ValidationException catch (e) {
      _error = e.message;
    } on NetworkException catch (e) {
      _error = 'İnternet bağlantınızı kontrol edin';
    } on ServerException catch (e) {
      _error = 'Sunucu hatası oluştu. Lütfen daha sonra tekrar deneyin';
    } on ApiException catch (e) {
      _error = e.message;
    } catch (e) {
      _error = 'Beklenmeyen bir hata oluştu';
    }

    _isLoading = false;
    notifyListeners();
    return false;
  }
}