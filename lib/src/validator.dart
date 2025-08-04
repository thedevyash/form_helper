class FormValidator {
  static String? validateEmail(
    String? value, {
    String requiredMessage = 'Email is required.',
    String invalidMessage = 'Enter a valid email address.',
  }) {
    if (value == null || value.isEmpty) return requiredMessage;
    final regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!regex.hasMatch(value)) return invalidMessage;
    return null;
  }

  static String? validatePassword(
    String? value, {
    int minLength = 6,
    String requiredMessage = 'Password is required.',
    String lengthMessage = 'Password must be at least {minLength} characters.',
  }) {
    if (value == null || value.isEmpty) return requiredMessage;
    if (value.length < minLength) {
      return lengthMessage.replaceAll('{minLength}', '$minLength');
    }
    return null;
  }

  static String? validateConfirmPassword(
    String? value,
    String? originalPassword, {
    String requiredMessage = 'Please confirm your password.',
    String mismatchMessage = 'Passwords do not match.',
  }) {
    if (value == null || value.isEmpty) return requiredMessage;
    if (value != originalPassword) return mismatchMessage;
    return null;
  }

  static String? validatePhone(
    String? value, {
    String requiredMessage = 'Phone number is required.',
    String invalidMessage = 'Enter a valid 10-digit phone number.',
  }) {
    if (value == null || value.isEmpty) return requiredMessage;
    final regex = RegExp(r'^\d{10}$');
    if (!regex.hasMatch(value)) return invalidMessage;
    return null;
  }

  static String? validateName(
    String? value, {
    String requiredMessage = 'Name is required.',
    String invalidMessage = 'Name must contain only letters and spaces.',
  }) {
    if (value == null || value.isEmpty) return requiredMessage;
    final regex = RegExp(r"^[a-zA-Z\s]+$");
    if (!regex.hasMatch(value)) return invalidMessage;
    return null;
  }

  static String? validateUsername(
    String? value, {
    String requiredMessage = 'Username is required.',
    String invalidMessage =
        'Username must be at least 3 characters and contain only letters, numbers, or underscores.',
  }) {
    if (value == null || value.isEmpty) return requiredMessage;
    final regex = RegExp(r'^[a-zA-Z0-9_]{3,}$');
    if (!regex.hasMatch(value)) return invalidMessage;
    return null;
  }

  // static String? validateOtp(
  //   String? value, {
  //   int length = 6,
  //   String requiredMessage = 'OTP is required.',
  //   String invalidMessage = 'Enter a valid {length}-digit OTP.',
  // }) {
  //   if (value == null || value.isEmpty) return requiredMessage;
  //   final regex = RegExp(r'^\d{$length}$');
  //   if (regex.hasMatch(value)) {
  //     return invalidMessage.replaceAll('{length}', '$length');
  //   }
  //   return null;
  // }

  static String? validateNotEmpty(
    String? value, {
    String fieldName = 'This field',
    String? requiredMessage,
  }) {
    if (value == null || value.trim().isEmpty) {
      return requiredMessage ?? '$fieldName is required.';
    }
    return null;
  }
}
