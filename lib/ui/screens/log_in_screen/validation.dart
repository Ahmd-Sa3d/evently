class AppRegex {
  static String? userNAme(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field cannot be empty';
    }
    return null;
  }

  static String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field cannot be empty';
    }

    // التحقق من وجود علامة @ في الإيميل
    if (!value.contains('@')) {
      return 'Email must contain @ symbol';
    }

    // تحقق من صيغة الإيميل باستخدام regex
    RegExp emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }

    return null; // يعني أن الإيميل صحيح
  }

  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field cannot be empty';
    }

    if (value.length < 8) {
      return 'Password should be at least 8 characters';
    }

    // تحقق من قوة كلمة المرور
    bool hasUppercase = value.contains(RegExp(r'[A-Z]'));
    bool hasDigits = value.contains(RegExp(r'[0-9]'));
    bool hasSpecial = value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));

    if (!hasUppercase) {
      return 'Password should contain at least one uppercase letter';
    }
    if (!hasDigits) {
      return 'Password should contain at least one digit';
    }
    if (!hasSpecial) {
      return 'Password should contain at least one special character';
    }

    return null;
  }

  static String? rePasswordValidator(String? value, String? originalPassword) {
    if (value == null || value.isEmpty) {
      return 'Please re-enter the password';
    }
    if (value != originalPassword) {
      return 'Passwords do not match';
    }
    return null;
  }

  static String? phoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number cannot be empty';
    }

    // Remove all non-digit characters except leading +
    final cleanedNumber = value.replaceAll(RegExp(r'[^\d+]'), '');

    // Basic validation for international numbers
    if (!RegExp(r'^\+?[0-9]{8,15}$').hasMatch(cleanedNumber)) {
      return 'Enter a valid phone number (8-15 digits)';
    }

    if (value.length < 11 || value.length > 11) {
      return 'Phone number should be 11 digits';
    }

    return null;
  }
}