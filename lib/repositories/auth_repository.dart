import 'package:buynsell/models/user_model.dart';

/// Abstract repository defining the authentication and user profile data contract
/// for the IIT BHU Buy & Sell Marketplace app.
abstract class AuthRepository {
  /// Signs in a user with their email and password.
  ///
  /// TODO: Implement authentication logic (e.g., Firebase Auth or REST API).
  Future<UserModel> signIn({
    required String email,
    required String password,
  });

  /// Registers a new user account with student profile details.
  ///
  /// TODO: Implement user registration and save profile data.
  Future<UserModel> signUp({
    required String name,
    required String email,
    required String password,
    String? hostel,
    String? roomNumber,
    String? phoneNumber,
  });

  /// Signs out the currently authenticated user.
  ///
  /// TODO: Implement sign out logic and session clearing.
  Future<void> signOut();

  /// Fetches the currently authenticated user, or returns null if no active session.
  ///
  /// TODO: Retrieve current session user data from auth provider or cache.
  Future<UserModel?> getCurrentUser();

  /// Sends a password reset email to the specified [email] address.
  ///
  /// TODO: Implement password reset flow.
  Future<void> resetPassword({
    required String email,
  });

  /// Updates profile details of an existing user.
  ///
  /// TODO: Update user details in database/backend.
  Future<UserModel> updateProfile(UserModel user);

  /// Triggers or verifies email verification for IIT BHU domain check.
  ///
  /// TODO: Implement email verification check.
  Future<void> verifyEmail();
}
