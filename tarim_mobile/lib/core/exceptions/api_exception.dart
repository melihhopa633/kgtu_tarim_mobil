class ApiException implements Exception {
  final String message;
  final int? statusCode;
  final dynamic data;

  ApiException({
    required this.message,
    this.statusCode,
    this.data,
  });

  @override
  String toString() => 'ApiException: $message (Status Code: $statusCode)';
}

class NetworkException extends ApiException {
  NetworkException({String message = 'Network connection error'})
      : super(message: message);
}

class UnauthorizedException extends ApiException {
  UnauthorizedException({String message = 'Unauthorized access'})
      : super(message: message, statusCode: 401);
}

class ServerException extends ApiException {
  ServerException({String message = 'Server error occurred'})
      : super(message: message, statusCode: 500);
}

class ValidationException extends ApiException {
  ValidationException({String message = 'Validation failed', dynamic data})
      : super(message: message, statusCode: 422, data: data);
}

class NotFoundException extends ApiException {
  NotFoundException({String message = 'Resource not found'})
      : super(message: message, statusCode: 404);
}