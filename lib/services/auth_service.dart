import 'package:buynsell/models/user_model.dart';
import 'package:buynsell/repositories/auth_repository.dart';

/// AuthService manages authentication and user profile operations
/// for the Buy N Sell IIT BHU marketplace.
class AuthService {
  final AuthRepository _authRepository;

  AuthService({required this._authRepository});

  /// Signs in a user using email and password.
  Future<UserModel?> signIn({
    required String email,
    required String password,
  }) async {
    // TODO: Implement signIn using _authRepository
    throw UnimplementedError('signIn() has not been implemented.');
  }

  /// Registers a new user with IIT BHU credential details.
  Future<UserModel?> signUp({
    required String name,
    required String email,
    required String password,
    String? phone,
    String? hostel,
    String? room,
  }) async {
    // TODO: Implement signUp using _authRepository
    throw UnimplementedError('signUp() has not been implemented.');
  }

  /// Signs out the currently authenticated user.
  Future<void> signOut() async {
    // TODO: Implement signOut using _authRepository
    throw UnimplementedError('signOut() has not been implemented.');
  }

  /// Gets the currently authenticated user.
  Future<UserModel?> getCurrentUser() async {
    // TODO: Implement getCurrentUser using _authRepository
    throw UnimplementedError('getCurrentUser() has not been implemented.');
  }

  /// Sends a password reset email to the given email address.
  Future<void> resetPassword(String email) async {
    // TODO: Implement resetPassword using _authRepository
    throw UnimplementedError('resetPassword() has not been implemented.');
  }

  /// Updates the profile details for the authenticated user.
  Future<UserModel?> updateProfile({
    String? name,
    String? phone,
    String? hostel,
    String? room,
    String? profileImageUrl,
  }) async {
    // TODO: Implement updateProfile using _authRepository
    throw UnimplementedError('updateProfile() has not been implemented.');
  }

  /// Sends or verifies email confirmation for IIT BHU domain check.
  Future<bool> verifyEmail() async {
    // TODO: Implement verifyEmail using _authRepository
    throw UnimplementedError('verifyEmail() has not been implemented.');
  }
}
