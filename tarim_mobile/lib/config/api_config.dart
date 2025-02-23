class ApiConfig {
  static const String baseUrl = 'https://kgtutarim-cygzhnewd6djaxfz.polandcentral-01.azurewebsites.net/api/v1';
  
  // Auth endpoints
  static const String login = '/auth/login';
  static const String signup = '/auth/signup';

  // Common headers
  static const Map<String, String> defaultHeaders = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Access-Control-Allow-Origin': '*',  // For CORS - may need to be more restrictive in production
  };

  // Timeouts and retry configuration
  static const Duration timeoutDuration = Duration(seconds: 30);
  static const int maxRetries = 3;
  static const Duration retryDelay = Duration(seconds: 2);

  // HTTP Status Codes
  static const int statusOk = 200;
  static const int statusCreated = 201;
  static const int statusBadRequest = 400;
  static const int statusUnauthorized = 401;
  static const int statusNotFound = 404;
  static const int statusServerError = 500;
}