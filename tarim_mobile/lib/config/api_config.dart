class ApiConfig {
  static const String baseUrl = 'https://kgtutarim-cygzhnewd6djaxfz.polandcentral-01.azurewebsites.net/api/v1';
  
  // Auth endpoints
  static const String login = '/Users/Login';
  static const String signup = '/Users';

  // Common headers
  static const Map<String, String> defaultHeaders = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  // Add other API configurations here as needed
  static const Duration timeoutDuration = Duration(seconds: 30);
}