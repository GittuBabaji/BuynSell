/// Form validation helper containing static methods returning String? for input fields.
class ValidationHelper {
  // Private constructor to prevent instantiation
  ValidationHelper._();

  /// Validates an email address.
  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    }

    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    if (!emailRegex.hasMatch(value.trim())) {
      return 'Please enter a valid email address';
    }

    return null;
  }

  /// Validates password length and complexity.
  static String? validatePassword(String? value, {int minLength = 6}) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    if (value.length < minLength) {
      return 'Password must be at least $minLength characters long';
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

    return null;
  }

  /// Validates generic required fields.
  static String? validateRequired(String? value, [String fieldName = 'This field']) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }

    return null;
  }

  // TODO: Add IIT BHU roll number or hostel address validation logic
}
