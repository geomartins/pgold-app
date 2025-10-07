import 'package:pgold/config/enumefy.dart';
import 'package:flutter/material.dart';

abstract class PalleteBase {
  Color scaffoldColor(ThemeModeType themeModeType);
  Color primaryColor(ThemeModeType themeModeType);
  Color textColor(ThemeModeType themeModeType);
  Color errorColor(ThemeModeType themeModeType);
  Color successColor(ThemeModeType themeModeType);
  Color buttonColor(ThemeModeType themeModeType);
  Color appBarColor(ThemeModeType themeModeType);
  Color bottomNavigationBarColor(ThemeModeType themeModeType);
  Color textFieldBorderColor(ThemeModeType themeModeType);
  Color textFieldFillColor(ThemeModeType themeModeType);
  Color containerColor(ThemeModeType themeModeType);
  Color bottomSheetColor(ThemeModeType themeModeType);
  Color modalColor(ThemeModeType themeModeType);
  Color iconColor(ThemeModeType themeModeType);
  Color greyAppColor(ThemeModeType themeModeType);
  Brightness systemUiOverlayStyleColor(ThemeModeType themeModeType);
  Color containerBorderColor(ThemeModeType themeModeType);
  Color datePickerColor(ThemeModeType themeModeType);
  Color shimmerBaseColor(ThemeModeType themeModeType);
  Color shimmerHighlightColor(ThemeModeType themeModeType);
  Color shimmerContainerColor(ThemeModeType themeModeType);
  Color biometricModalColor(ThemeModeType themeModeType);
  Color splashColor(ThemeModeType themeModeType);

  Color v3BackgroundColor(ThemeModeType themeModeType);
  Color v3TextColor(ThemeModeType themeModeType);
  Color v3ButtonColor(ThemeModeType themeModeType);
  Color v3ButtonTextColor(ThemeModeType themeModeType);
  Color v3ErrorColor(ThemeModeType themeModeType);
  Color v3LabelColor(ThemeModeType themeModeType);
  Color v3DividerColor(ThemeModeType themeModeType);
  Color v4TextColor(ThemeModeType themeModeType);
}
