import 'package:flutter/cupertino.dart';

class DashboardEditor {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  void clear() {
    email.clear();
    password.clear();
  }
}
