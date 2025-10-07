import 'dart:math';
import 'package:pgold/config/enumefy.dart';
import 'package:pgold/config/palletefy.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:pgold/modules/auth/screens/login.dart';
import 'package:pgold/utils/session_util.dart';
import 'package:recase/recase.dart';
import 'dart:io' show Platform;

extension StringExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}

extension DateTimeExtension on DateTime {
  DateTime get firstDayOfWeek => subtract(Duration(days: weekday - 1));

  DateTime get lastDayOfWeek =>
      add(Duration(days: DateTime.daysPerWeek - weekday));

  DateTime get lastDayOfMonth =>
      month < 12 ? DateTime(year, month + 1, 0) : DateTime(year + 1, 1, 0);
}

class FlexUtil extends Palletefy {
  static String numberFormat(dynamic number, {bool decimal = false}) {
    if (number == null || number == 'null' || number == '') {
      return '';
    }
    if (decimal == false) {
      NumberFormat myFormat = NumberFormat.decimalPattern('en_us');
      return myFormat.format(double.parse(number));
    } else {
      NumberFormat myFormat = NumberFormat("#,##0.00", "en_US");
      return myFormat.format(double.parse(number));
    }
  }

  static double convertToDouble(dynamic value) {
    if (value is String) {
      // Convert String to double
      return double.tryParse(value) ??
          0.0; // Returns 0.0 if the string is not a valid double
    } else if (value is int) {
      // Convert int to double
      return value.toDouble();
    } else if (value is double) {
      // If it's already a double, return as is
      return value;
    }
    return 0.0; // Default return if none of the conditions are met
  }

  static String convertToStringIfDoubleOrInt(dynamic value) {
    if (value is num) {
      // If the value is a number (int or double), return it as a string
      return value.toString();
    } else {
      // For non-numeric types, return an empty string (or handle accordingly)
      return '';
    }
  }

  static double convertToDoubleIfStringOrInt(dynamic value) {
    // Check if the value is a string
    if (value is String) {
      try {
        // Try parsing the string as a double
        return double.parse(value);
      } catch (e) {
        // If parsing fails, print a debug message (optional) and return 0.0
        return 0.0;
      }
    }

    // If the value is a number (int or double), return it as a double
    else if (value is num) {
      return value.toDouble();
    }

    // For all other types, return 0.0
    else {
      return 0.0;
    }
  }

  static String pickTodoColor() {
    List<String> colors = [
      '#00A0FA',
      '#F59600',
      '#003C6E',
      '#F01428',
      '#00A0FA',
      '#F59600',
      '#003C6E',
      '#F01428',
    ];

    // Generate a random index
    var randomIndex = Random().nextInt(colors.length);

    // Pick a random color from the list
    String randomColor = colors[randomIndex];

    // Print the random color
    return randomColor;
  }

  static String extractAccessCodeFromAuthUrl(String url) {
    // Use a regular expression to extract the string after the last '/'
    RegExp regExp = RegExp(r'\/([^\/]+)$');

    // Try matching the URL and extracting the desired value
    Match? match = regExp.firstMatch(url);

    if (match != null) {
      return match.group(1)!;
    } else {
      return ""; // Return an empty string if no match is found
    }
  }

  static String generateRandomString(int length) {
    const characters =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    Random random = Random();
    String result = '';

    for (int i = 0; i < length; i++) {
      result += characters[random.nextInt(characters.length)];
    }

    return result;
  }

  static String ucwords(String value) {
    return value.toTitleCase();
  }

  static String replaceAcc(String value) {
    return value.replaceAll("Accounts", "Account");
  }

  static String convertPhoneNumber(String phoneNumber) {
    // Check if the phone number starts with the country code (e.g., "234" for Nigeria)
    if (phoneNumber.startsWith('234')) {
      // Remove the country code '234' and prepend '0' to the local number
      return '0${phoneNumber.substring(3)}'; // Removes '234' and adds '0' at the beginning
    }
    // If the phone number does not start with the expected country code, return as is
    return phoneNumber;
  }

  static String convertToInternationalFormat(String localNumber) {
    // Check if the number starts with '0' (local format)
    if (localNumber.startsWith('0')) {
      // Replace the leading '0' with the country code +234 (for Nigeria)
      return '234${localNumber.substring(1)}';
    }
    // If the number does not start with '0', assume it is already in international format
    return localNumber;
  }

  static String getChannel() {
    if (Platform.isAndroid) {
      return 'android';
    } else if (Platform.isIOS) {
      return 'ios';
    } else {
      return '';
    }
  }

  static Future<String> getDeviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    if (GetPlatform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      return androidInfo.model;
    }

    if (GetPlatform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      return iosInfo.utsname.machine;
    }
    return "";
  }

  static void isTyping() {
    // Get.put<AnnotatedRegionWidgetController>(AnnotatedRegionWidgetController())
    //     .initializeTimer();
  }

  static String replaceWithAsterisks(String input) {
    if (input.length <= 4) {
      return input; // If the string is less than or equal to 4 characters, return it as is
    } else {
      String firstPart =
          input.substring(0, 4); // Extract the first 4 characters
      String maskedPart = '*' *
          (input.length - 4); // Replace the remaining characters with asterisks
      return firstPart + maskedPart; // Combine both parts
    }
  }

  static String ucwordsWithRecase(String value) {
    return value.snakeCase.replaceAll('_', ' ').toTitleCase();
  }

  static List<String> convertDateToList(String date) {
    DateTime targetDate = DateTime.parse(date);
    // Get the current date and time
    DateTime currentDate = DateTime.now();

    // Calculate the difference between the current date and the target date
    Duration difference = targetDate.difference(currentDate);

    // Extract days, hours, minutes, and seconds
    int days = difference.inDays;
    int hours = difference.inHours % 24;
    int minutes = difference.inMinutes % 60;
    int seconds = difference.inSeconds % 60;

    return [
      days.toString(),
      hours.toString(),
      minutes.toString(),
      seconds.toString()
    ];
  }

  static String ucwordsWithSplit(String value) {
    if (value.isEmpty) return '';
    return value.split(' ')[0].toLowerCase().toTitleCase();
  }

  static String extractInitials(String fullName) {
    // Split the full name into parts
    List<String> nameParts = fullName.split(' ');

    // Check if there are at least two parts (First and Second Name)
    if (nameParts.length >= 2) {
      // Extract the first letter of the first and second names and combine them
      String initials = '${nameParts[0][0]}${nameParts[1][0]}'.toUpperCase();
      return initials;
    } else {
      return 'AB'; // If there are not enough parts to extract initials
    }
  }

  static String extractFirstAndSecondName(String fullName) {
    fullName = fullName.replaceAll(',', ' ');
    List<String> nameParts = fullName.split(' ');

    // Check if there are at least two parts (First and Second Name)
    if (nameParts.length >= 2) {
      return '${nameParts[0]} ${nameParts[1]}'
          .toLowerCase()
          .toTitleCase(); // Return the first and second names
    } else {
      return fullName
          .toLowerCase()
          .toTitleCase(); // If there's only one name, return it as is
    }
  }

  static void hideLoadingOverlay() {
    Loader.hide();
  }

  static String greetings() {
    final int hour = DateTime.now().hour;

    // Determine the greeting based on the time of day
    if (hour >= 6 && hour < 12) {
      return 'Good Morning,';
    } else if (hour >= 12 && hour < 17) {
      return 'Good Afternoon,';
    } else if (hour >= 17 && hour < 20) {
      return 'Good Evening,'; // Added Evening
    } else {
      return 'Hello, ';
    }
  }

  static void showLoadingOverlay(BuildContext context,
      {bool biometricOverlay = false}) {
    Loader.show(context,
        isSafeAreaOverlay: true,
        isAppbarOverlay: true,
        isBottomBarOverlay: true,
        themeData: Theme.of(context).copyWith(
            colorScheme:
                ColorScheme.fromSwatch().copyWith(secondary: Colors.black38)),
        overlayColor: biometricOverlay == false
            ? Palletefy().modalColor(ThemeModeType.systemMode)
            : Palletefy().biometricModalColor(ThemeModeType.systemMode));

    //
  }

  static String convertDateToHumanReadableFormat(String? dateString) {
    // If dateString is null or empty, return an empty string
    if (dateString == null || dateString.isEmpty) {
      return "";
    }

    try {
      // Parse the string into DateTime
      DateTime expirationDateTime = DateTime.parse(dateString);

      // Format DateTime to "Feb 21, 2025"
      String formattedDate =
          DateFormat('MMM dd, yyyy').format(expirationDateTime);

      // Return the formatted date
      return formattedDate;
    } catch (e) {
      // In case of any error in parsing, return an empty string
      return "";
    }
  }

  static String convertUnixToDateTime(int date) {
    final mDate = DateTime.fromMillisecondsSinceEpoch(date * 1000);
    var format = DateFormat("yyyy-MM-dd hh:mm");
    var dateString = format.format(mDate);
    return dateString;
  }

  static String convertToDateTime(String formattedString,
      {String options = 'MMMM d yyyy  hh:mm aaa'}) {
    final DateTime now = DateTime.parse(formattedString);
    var format = DateFormat(options);
    var dateString = format.format(now);
    dateString = dateString
        .replaceAll(RegExp(r'\bAM\b'), 'am')
        .replaceAll(RegExp(r'\bPM\b'), 'pm');
    return dateString;
  }

  static String obscureTelephone(String value) {
    if (value.length < 11) {
      return '';
    }
    return value.replaceRange(3, 8, '**********');
  }

  static String obscure(String value) {
    return '*****';
  }

  static String obscureBeta(String value) {
    return '🙈🙈🙈';
  }

  static int differenceInDate(int date) {
    if (date == 0) return 0;
    final dt = DateTime.fromMillisecondsSinceEpoch(date * 1000);
    Duration diff = DateTime.now().difference(dt);
    return diff.inDays;
  }

  static String convertUnixToHumanReadable(int date) {
    final mDate = DateTime.fromMillisecondsSinceEpoch(date * 1000);
    var format = DateFormat();
    var dateString = format.format(mDate);
    return dateString;
  }

  static Future<void> login(String token) async {
    await SessionUtil().write('token', token);
    Future.delayed(
        const Duration(minutes: 45), () => SessionUtil().remove('token'));
  }

  static Future<void> logout() async {
    //clear all cache
    await clearCache();
    //logout
    await SessionUtil().remove('token');
    //Get.deleteAll();
    Get.offAllNamed(Login.id);
  }

  static Future<void> clearCache() async {
    //clear all cache
  }
}
