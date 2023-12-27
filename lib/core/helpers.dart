import 'package:fluttertoast/fluttertoast.dart';

class Helpers {
  static String? validateEmail(String? value) {
    const pattern = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
        "\\@" +
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
        "(" +
        "\\." +
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
        ")+";

    final regex = RegExp(pattern);

    if (value!.isEmpty) {
      return "Enter email address";
    } else {
      return !regex.hasMatch(value) ? 'Enter a valid email address' : null;
    }
  }

  static String? requiredValidation(String? value) {
    if (value!.isEmpty) {
      return "This field is mandatory";
    }
  }

  static String? passwordValidation(String? value) {
    if (value == null || value.isEmpty) {
      return "This field is mandatory";
    } else if (value.length < 6) {
      return "Password must be at least 6 characters";
    }
    // Additional conditions can be added if needed
    return null; // Return null if the value meets the validation criteria
  }

  static void showToast(String msg) {
    print("msg " + msg);

    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        fontSize: 16.0);
  }
}
