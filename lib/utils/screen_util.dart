import 'package:flutter/services.dart';
import 'package:mobile_device_identifier/mobile_device_identifier.dart';
import 'notification_util.dart';

class ScreenUtils {
  Future<String> macAddress() async {
    String platformVersion = "";
    try {
      platformVersion = await MobileDeviceIdentifier().getDeviceId() ?? '';
    } on PlatformException {
      platformVersion = '';
      NotificationUtil().showErrorSnackbar('Oops!!', 'failed to get deviceID ');
    }
    return platformVersion;
  }
}
