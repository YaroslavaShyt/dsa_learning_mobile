class InputValidators {
  static bool isValidEmail(String email) {
    if (email.contains(' ')) return false;
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  static bool isValidPassword(String password) {
    final trimmedPassword = password.trim();
    return trimmedPassword.isNotEmpty && password.length >= 6;
  }

  static bool isValidName(String name) {
    final trimmedName = name.trim();
    return trimmedName.isNotEmpty;
  }
}
