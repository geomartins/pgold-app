import 'package:flutter/material.dart';

mixin KeyboardUtil {
  void removeFocus() {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
