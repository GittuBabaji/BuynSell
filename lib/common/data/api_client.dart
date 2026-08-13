class ApiClient {
  final String baseUrl;
  String? authToken;

  ApiClient({
    this.baseUrl = 'https://api.buynsell.iitbhu.ac.in/v1',
    this.authToken,
  });

  Map<String, String> get _headers {
    // TODO: Return HTTP headers including authorization token if available
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      if (authToken != null) 'Authorization': 'Bearer $authToken',
    };
  }

  Future<dynamic> get(String endpoint) async {
    // TODO: Implement HTTP GET request
    return null;
  }

  Future<dynamic> post(String endpoint, Map<String, dynamic> body) async {
    // TODO: Implement HTTP POST request
    return null;
  }

  Future<dynamic> put(String endpoint, Map<String, dynamic> body) async {
    // TODO: Implement HTTP PUT request
    return null;
  }

  Future<dynamic> delete(String endpoint) async {
    // TODO: Implement HTTP DELETE request
    return null;
  }

  Future<dynamic> uploadFile(String endpoint, String filePath) async {
    // TODO: Implement multipart HTTP file upload request
    return null;
  }
}
