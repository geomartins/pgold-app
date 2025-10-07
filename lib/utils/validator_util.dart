import 'package:pgold/utils/flex_util.dart';

class ValidatorUtil {
  Map<String, dynamic> errorBag = {};
  Map<String, dynamic> data;
  ValidatorUtil(this.data);

  ValidatorUtil validate(Map<String, dynamic> obj) {
    //{ username: min:3|max:5|required }
    obj.forEach((label, validationRules) {
      _processRules(
          label, validationRules.split("|") ?? []); //username, [min:3,max:4]
    });
    return this;
  }

  void _processRules(String label, List<String> validationRules) {
    for (String validationRule in validationRules) {
      if (validationRule.contains("min:")) {
        _min(label, validationRule); //username, min:3
      }
      if (validationRule.contains("required")) {
        _required(label, validationRule); //username, required
      }
      if (validationRule.contains("email")) {
        _email(label, validationRule); //username, required
      }
      if (validationRule.contains("password")) {
        _password(label, validationRule); //username, required
      }

      if (validationRule.contains("length")) {
        _length(label, validationRule); //username, required
      }
    }
  }

  void _min(String label, String validationRule) {
    //username, min:6
    String value = validationRule.split(":")[1];
    if (data[label].length < int.parse(value)) {
      errorBag[label] =
          "${FlexUtil.ucwordsWithRecase(label)} field must be at least ${value.toString()} characters long";
    } else {
      errorBag[label] = "";
    }
  }

  void _length(String label, String validationRule) {
    //username, min:6
    String value = validationRule.split(":")[1];
    if (data[label].length != int.parse(value)) {
      errorBag[label] =
          "${FlexUtil.ucwordsWithRecase(label)} field must be  ${value.toString()} characters long";
    } else {
      errorBag[label] = "";
    }
  }

  void _required(String label, String validationRule) {
    //username, min:6
    if (data[label].toString().isEmpty) {
      errorBag[label] =
          "${FlexUtil.ucwordsWithRecase(label)} field is required";
    } else {
      // errorBag.remove(label);
      errorBag[label] = "";
    }
  }

  void _email(String label, String validationRule) {
    //username, min:6
    if (!data[label].toString().contains('@')) {
      errorBag[label] =
          "${FlexUtil.ucwordsWithRecase(label)} field must be valid";
    } else {
      errorBag[label] = "";
    }
  }

  void _password(String label, String validationRule) {
    if (_isPasswordCompliant(data[label]) == false) {
      errorBag[label] =
          "${FlexUtil.ucwords(label)} field must contain uppercase, lowercase, number, symbols and the length must be at least 8 characters";
    } else {
      errorBag[label] = "";
    }
  }

  bool _isPasswordCompliant(String password, [int minLength = 8]) {
    if (password.length < minLength) {
      return false;
    }

    bool hasUppercase = password.contains(RegExp(r'[A-Z]'));
    if (hasUppercase) {
      bool hasDigits = password.contains(RegExp(r'[0-9]'));
      if (hasDigits) {
        bool hasLowercase = password.contains(RegExp(r'[a-z]'));
        if (hasLowercase) {
          bool hasSpecialCharacters =
              password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
          return hasSpecialCharacters;
        }
      }
    }

    return false;
  }
}
