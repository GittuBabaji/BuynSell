/// Form validation helper containing static methods returning String? for input fields.
class ValidationHelper {
  // Private constructor to prevent instantiation
  ValidationHelper._();

  /// Validates an IIT BHU email address.
  /// Must end with `@iitbhu.ac.in` or `@itbhu.ac.in`.
  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    }

    final email = value.trim().toLowerCase();

    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@(iitbhu\.ac\.in|itbhu\.ac\.in)$',
    );

    if (!emailRegex.hasMatch(email)) {
      return 'Only @iitbhu.ac.in or @itbhu.ac.in emails are allowed';
    }

    return null;
  }

  /// Validates password strength.
  ///
  /// Must contain at least:
  /// - [minLength] characters (default 8)
  /// - One lowercase letter
  /// - One uppercase letter
  /// - One digit
  /// - One special symbol
  static String? validatePassword(String? value, {int minLength = 8}) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    if (value.length < minLength) {
      return 'Password must be at least $minLength characters long';
    }

    if (!value.contains(RegExp(r'[a-z]'))) {
      return 'Password must contain a lowercase letter';
    }

    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain an uppercase letter';
    }

    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain a number';
    }

    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>_\-+=\[\]\\\/~`]'))) {
      return 'Password must contain a special symbol';
    }

    return null;
  }

  /// Validates that [confirmPassword] matches [password].
  static String? validateConfirmPassword(String? confirmPassword, String password) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return 'Please confirm your password';
    }

    if (confirmPassword != password) {
      return 'Passwords do not match';
    }

    return null;
  }

  /// Validates an Indian 10-digit phone number.
  static String? validatePhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Phone number is required';
    }

    final cleanPhone = value.trim().replaceAll(RegExp(r'[\s\-+]'), '');
    final phoneRegex = RegExp(r'^[6-9]\d{9}$');

    if (!phoneRegex.hasMatch(cleanPhone)) {
      return 'Please enter a valid 10-digit phone number';
    }

    return null;
  }

  /// Validates name fields.
  static String? validateName(String? value, {int minLength = 2}) {
    if (value == null || value.trim().isEmpty) {
      return 'Name is required';
    }

    if (value.trim().length < minLength) {
      return 'Name must be at least $minLength characters';
    }

    return null;
  }

  /// Validates product price input.
  static String? validatePrice(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Price is required';
    }

    final price = double.tryParse(value.trim());
    if (price == null) {
      return 'Please enter a valid price number';
    }

    if (price < 0) {
      return 'Price cannot be negative';
    }
    if (price > 1000000) {
      return 'Price cannot exceed ₹10,00,000';
    }
    return null;
  }

  /// Validates generic required fields.
  static String? validateRequired(String? value, [String fieldName = 'This field']) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }

    return null;
  }
}
