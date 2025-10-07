import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pgold/store.dart';

class IsAuth extends GetMiddleware {
  int? priorityIndex;

  IsAuth({int? priorityIndex});

  @override
  int get priority => priorityIndex ?? -8;

  @override
  RouteSettings? redirect(String? route) {
    return AppStore.to.isLoggedIn ? null : const RouteSettings(name: '/login');
  }

  @override
  void onPageDispose() {
    //print('PageDisposed');
  }
}
