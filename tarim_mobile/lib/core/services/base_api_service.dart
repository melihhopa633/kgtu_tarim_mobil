import 'dart:convert';
import 'package:http/http.dart' as http;
import '../exceptions/api_exception.dart';

class BaseApiService {
  Future<dynamic> handleResponse(http.Response response) async {
    switch (response.statusCode) {
      case 200:
      case 201:
        return json.decode(response.body);
      case 401:
        throw UnauthorizedException(
          message: json.decode(response.body)['message'] ?? 'Unauthorized access'
        );
      case 404:
        throw NotFoundException(
            message: json.decode(response.body)['message'] ?? 'Resource not found'
        );
      case 422:
        throw ValidationException(
          message: json.decode(response.body)['message'] ?? 'Validation failed',
          data: json.decode(response.body)['errors']
        );
      case 500:
        throw ServerException(
          message: json.decode(response.body)['message'] ?? 'Server error occurred'
        );
      default:
        throw ApiException(
          message: json.decode(response.body)['message'] ?? 'Something went wrong',
          statusCode: response.statusCode
        );
    }
  }

  Future<dynamic> post(String url, dynamic body, {Map<String, String>? headers}) async {
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          ...?headers,
        },
        body: json.encode(body),
      );
      return handleResponse(response);
    } catch (e) {
      throw NetworkException(message: e.toString());
    }
  }

  Future<dynamic> get(String url, {Map<String, String>? headers}) async {
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          ...?headers,
        },
      );
      return handleResponse(response);
    } catch (e) {
      throw NetworkException(message: e.toString());
    }
  }
}