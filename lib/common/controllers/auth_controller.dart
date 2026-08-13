import 'package:flutter/foundation.dart';

class AuthController extends ChangeNotifier {
  Map<String, dynamic>? currentUser;
  bool isLoggedIn = false;
  bool isLoading = false;

  Future<bool> login(String email, String password) async {
    // TODO: Implement user login logic via API Client
    return false;
  }

  Future<bool> register(Map<String, dynamic> userData) async {
    // TODO: Implement user registration logic via API Client
    return false;
  }

  Future<void> logout() async {
    // TODO: Implement user logout logic and clear local storage
  }

  Future<void> checkAuth() async {
    // TODO: Implement authentication check from local storage token
  }
}
