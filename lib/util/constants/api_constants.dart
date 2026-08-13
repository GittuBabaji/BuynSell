/// API endpoint constants for the backend services.
class ApiConstants {
  // Private constructor to prevent instantiation
  ApiConstants._();

  // Base URL
  static const String baseUrl = 'https://api.buynsell.iitbhu.ac.in/v1';

  // Endpoint routes
  static const String authEndpoint = '$baseUrl/auth';
  static const String productsEndpoint = '$baseUrl/products';
  static const String chatEndpoint = '$baseUrl/chat';
  static const String transactionsEndpoint = '$baseUrl/transactions';
  static const String usersEndpoint = '$baseUrl/users';
  static const String uploadEndpoint = '$baseUrl/upload';

  // Timeout settings
  static const Duration connectTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);

  // TODO: Add headers, query parameters, or token keys configuration
}
