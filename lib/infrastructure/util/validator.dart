import 'package:email_validator/email_validator.dart';

class Validator {
  static String? name(String? name) {
    if (name == null) { return null; }
    if (name.isEmpty) { return 'Name can\'t be empty'; }
    return null;
  }

  static String? email(String? email) {
    if (email == null) { return null; }
    if (email.isEmpty) { return 'Email can\'t be empty'; }
    if (!EmailValidator.validate(email)) { return 'Enter a correct email'; }
    return null;
  }

  static String? password(String? password) {
    if (password == null) { return null; }
    if (password.isEmpty) { return 'Password can\'t be empty'; }
    if (password.length < 6) { return 'Enter a password with length at least 6'; }
    return null;
  }
}