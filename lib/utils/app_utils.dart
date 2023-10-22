import 'package:intl/intl.dart';

class AppUtils {
  static String translateDateTime(DateTime? dt) {
    if (dt == null) return '';
    String formattedDate = DateFormat('EEE, MMM dd, yyyy hh:mm a').format(dt);
    return formattedDate;
  }

  static String translateDate(DateTime? dt) {
    if (dt == null) return '';
    String formattedDate = DateFormat('EEEE, MMMM dd, yyyy').format(dt);
    return formattedDate;
  }

  static String translateTime(DateTime? dt) {
    if (dt == null) return '';
    String formattedDate = DateFormat('hh:mm a').format(dt);
    return formattedDate;
  }

  static String translateTempCelcius(double? temp) {
    if (temp == null) return '';
    final double celcius = temp - 273.15;
    return '${celcius.toStringAsFixed(2)} \u2103';
  }

  static String? validateEmail(String? email) {
    if (email == null) return null;
    if (email.isEmpty) {
      return "Email can't be empty";
    }

    final bool isValid = RegExp(
            r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
        .hasMatch(email);

    if (!isValid) {
      return 'Enter a correct email';
    }
    return null;
  }

  static String? validatePassword(String? password) {
    if (password == null) {
      return null;
    }
    if (password.isEmpty) {
      return "Password can't be empty";
    }
    if (password.length < 8) {
      return 'Enter a password with length at least 8';
    }

    return null;
  }

  static String? validateConfirmPassword(
      String? password, String? confirmPassword) {
    if (password != null) {
      if (password != confirmPassword) {
        return 'Password not match';
      }
    }

    return null;
  }

  static String? validatePhoneNumber(String? phone) {
    if (phone == null) return null;
    if (phone.isEmpty) {
      return "Phone can't be empty";
    }

    if (phone.length < 8 || phone.length > 12) {
      return 'Please enter a correct phone number';
    }
    return null;
  }
}
