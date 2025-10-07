import 'package:pgold/abstracts/pallete_base.dart';
import 'package:pgold/config/enumefy.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class Palletefy implements PalleteBase {
  @override
  Color scaffoldColor(ThemeModeType themeModeType) {
    final Color lightPhase = const Color(0xfffbfcff).withOpacity(0.99);
    const Color darkPhase = Color(0xff242526); //Color(0xff2A2B36);
    return _handleLogic(themeModeType, lightPhase, darkPhase);
  }

  @override
  Color primaryColor(ThemeModeType themeModeType) {
    Color lightPhase = HexColor('#0052FF');
    Color darkPhase = HexColor('#0052FF');
    return _handleLogic(themeModeType, lightPhase, darkPhase);
  }

  @override
  Color errorColor(ThemeModeType themeModeType) {
    const Color lightPhase = Colors.red;
    const Color darkPhase = Colors.red;
    return _handleLogic(themeModeType, lightPhase, darkPhase);
  }

  @override
  Color textColor(ThemeModeType themeModeType) {
    const Color lightPhase = Color(0xff2A2B36);
    const Color darkPhase = Color(0xffF5F5F5);
    return _handleLogic(themeModeType, lightPhase, darkPhase);
  }

  @override
  Color buttonColor(ThemeModeType themeModeType) {
    const Color lightPhase = Color(0xff008ACA);
    const Color darkPhase = Color(0xff008ACA);
    return _handleLogic(themeModeType, lightPhase, darkPhase);
  }

  @override
  Color appBarColor(ThemeModeType themeModeType) {
    switch (themeModeType) {
      case ThemeModeType.lightMode:
        return HexColor('#FFFFFF'); //const Color(0xffF5F5F5);
      case ThemeModeType.darkMode:
        return const Color(0xff2A2B36);
      default:
        return const Color(0xfffbfcff).withOpacity(0.98);
    }
  }

  @override
  Color bottomNavigationBarColor(ThemeModeType themeModeType) {
    switch (themeModeType) {
      case ThemeModeType.lightMode:
        return Colors.white;
      case ThemeModeType.darkMode:
        return const Color(0xff2A2B36);
      default:
        return const Color(0xffF5F5F5);
    }
  }

  @override
  Color textFieldBorderColor(ThemeModeType themeModeType) {
    switch (themeModeType) {
      case ThemeModeType.lightMode:
        return HexColor('#E0E9FC');
      case ThemeModeType.darkMode:
        return const Color(0xff2A2B36);
      default:
        return const Color(0xffBABEC2);
    }
  }

  @override
  Color textFieldFillColor(ThemeModeType themeModeType) {
    Color lightPhase = Colors.white;
    Color darkPhase = const Color(0xffF5F5F5).withOpacity(0.05);
    return _handleLogic(themeModeType, lightPhase, darkPhase);
  }

  @override
  Color containerColor(ThemeModeType themeModeType) {
    const Color lightPhase = Colors.white; //Colors.grey.withOpacity(0.1)
    Color darkPhase = const Color(0xffF5F5F5).withOpacity(0.05);
    return _handleLogic(themeModeType, lightPhase, darkPhase);
  }

  @override
  Color bottomSheetColor(ThemeModeType themeModeType) {
    const Color lightPhase = Colors.white;
    const Color darkPhase = Color(0xff2A2B36);
    return _handleLogic(themeModeType, lightPhase, darkPhase);
  }

  @override
  Color iconColor(ThemeModeType themeModeType) {
    const Color lightPhase = Color(0xff2A2B36);
    const Color darkPhase = Colors.white;
    return _handleLogic(themeModeType, lightPhase, darkPhase);
  }

  @override
  Color modalColor(ThemeModeType themeModeType) {
    final Color lightPhase = const Color(0xff2A2B36).withOpacity(0.2);
    Color darkPhase = const Color(0xffF5F5F5).withOpacity(0.1);
    return _handleLogic(themeModeType, lightPhase, darkPhase);
  }

  Color _handleLogic(
      ThemeModeType themeModeType, Color lightPhase, Color darkPhase) {
    switch (themeModeType) {
      case ThemeModeType.lightMode:
        return lightPhase;
      case ThemeModeType.darkMode:
        return darkPhase;
      default:
        return Get.isDarkMode ? darkPhase : lightPhase;
    }
  }

  Brightness _handleLogic2(ThemeModeType themeModeType, Brightness lightPhase,
      Brightness darkPhase) {
    switch (themeModeType) {
      case ThemeModeType.lightMode:
        return lightPhase;
      case ThemeModeType.darkMode:
        return darkPhase;
      default:
        return Get.isDarkMode ? lightPhase : darkPhase;
    }
  }

  @override
  Color greyAppColor(ThemeModeType themeModeType) {
    Color lightPhase = Colors.grey.withOpacity(0.2);
    Color darkPhase = Colors.grey.withOpacity(0.3);
    return _handleLogic(themeModeType, lightPhase, darkPhase);
  }

  @override
  Brightness systemUiOverlayStyleColor(ThemeModeType themeModeType) {
    const Brightness lightPhase = Brightness.light;
    const Brightness darkPhase = Brightness.dark;
    return _handleLogic2(themeModeType, lightPhase, darkPhase);
  }

  @override
  Color successColor(ThemeModeType themeModeType) {
    const Color lightPhase = Color(0xff029632);
    const Color darkPhase = Color(0xff029632);
    return _handleLogic(themeModeType, lightPhase, darkPhase);
  }

  @override
  Color containerBorderColor(ThemeModeType themeModeType) {
    Color lightPhase = Colors.grey.withOpacity(0.2);
    Color darkPhase = Colors.grey.withOpacity(0.05);
    return _handleLogic(themeModeType, lightPhase, darkPhase);
  }

  @override
  Color datePickerColor(ThemeModeType themeModeType) {
    // TODO: implement datePickerColor
    const Color lightPhase = Color(0xff008ACA);
    Color darkPhase = const Color(0xff242526);
    return _handleLogic(themeModeType, lightPhase, darkPhase);
  }

  @override
  Color shimmerBaseColor(ThemeModeType themeModeType) {
    final Color lightPhase = Colors.grey.withOpacity(0.3);
    const Color darkPhase = Color(0xff2A2B36);
    return _handleLogic(themeModeType, lightPhase, darkPhase);
  }

  @override
  Color shimmerHighlightColor(ThemeModeType themeModeType) {
    const Color lightPhase = Colors.white;
    Color darkPhase = const Color(0xffF5F5F5).withOpacity(0.05);
    return _handleLogic(themeModeType, lightPhase, darkPhase);
  }

  @override
  Color shimmerContainerColor(ThemeModeType themeModeType) {
    Color lightPhase =
        Colors.white.withOpacity(0.3); //Colors.grey.withOpacity(0.1)
    Color darkPhase = Colors.white.withOpacity(0.3);
    return _handleLogic(themeModeType, lightPhase, darkPhase);
  }

  @override
  Color biometricModalColor(ThemeModeType themeModeType) {
    final Color lightPhase = const Color(0xfffbfcff).withOpacity(0.60);
    final Color darkPhase = const Color(0xff2A2B36).withOpacity(0.86);
    return _handleLogic(themeModeType, lightPhase, darkPhase);
  }

  @override
  Color splashColor(ThemeModeType themeModeType) {
    final Color lightPhase = HexColor("#E6F3FA");
    const Color darkPhase = Color(0xff242526);
    return _handleLogic(themeModeType, lightPhase, darkPhase);
  }

  @override
  Color v3BackgroundColor(ThemeModeType themeModeType) {
    final Color lightPhase = HexColor('#E6F3FA');
    Color darkPhase = const Color(0xFF1A1C1E);
    return _handleLogic(themeModeType, lightPhase, darkPhase);
  }

  @override
  Color v3TextColor(ThemeModeType themeModeType) {
    final Color lightPhase = HexColor('#003047');
    final Color darkPhase = HexColor('#E6F3FA');
    return _handleLogic(themeModeType, lightPhase, darkPhase);
  }

  @override
  Color v3ButtonColor(ThemeModeType themeModeType) {
    final Color lightPhase = HexColor('#006EA2');
    final Color darkPhase = Colors.white.withOpacity(.5);
    return _handleLogic(themeModeType, lightPhase, darkPhase);
  }

  @override
  Color v4TextColor(ThemeModeType themeModeType) {
    final Color lightPhase = HexColor('#006EA2');
    const Color darkPhase = Color(0xffF5F5F5);
    return _handleLogic(themeModeType, lightPhase, darkPhase);
  }

  @override
  Color v3ButtonTextColor(ThemeModeType themeModeType) {
    final Color lightPhase = HexColor('#E6F3FA');
    final Color darkPhase = HexColor('#E6F3FA');
    return _handleLogic(themeModeType, lightPhase, darkPhase);
  }

  @override
  Color v3ErrorColor(ThemeModeType themeModeType) {
    final Color lightPhase = HexColor('#ED4377');
    final Color darkPhase = HexColor('#ED4377');
    return _handleLogic(themeModeType, lightPhase, darkPhase);
  }

  @override
  Color v3LabelColor(ThemeModeType themeModeType) {
    final Color lightPhase = HexColor('#718096');
    const Color darkPhase = Color(0xffBABEC2);
    return _handleLogic(themeModeType, lightPhase, darkPhase);
  }

  @override
  Color v3DividerColor(ThemeModeType themeModeType) {
    final Color lightPhase = HexColor('#008ACA');
    Color darkPhase = const Color(0xfffbfcff).withOpacity(0.60);
    return _handleLogic(themeModeType, lightPhase, darkPhase);
  }
}
