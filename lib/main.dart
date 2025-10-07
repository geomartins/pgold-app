import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pgold/store.dart';
import 'package:pgold/utils/global_util.dart';
import 'package:shirne_dialog/shirne_dialog.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'config/routefy.dart';
import 'config/themefy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(
      fileName: foundation.kReleaseMode ? "production.env" : "development.env");
  await GlobalUtil.init();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
              textScaler: TextScaler.linear(GlobalUtil.scaleFactor(context))),
          child: child!,
        );
      },
      useInheritedMediaQuery: true,
      navigatorKey: MyDialog.navigatorKey,
      localizationsDelegates: const [
        ShirneDialogLocalizations.delegate,
      ],
      enableLog: true,
      initialBinding: AppStoreBinding(),
      debugShowCheckedModeBanner: false,
      title: dotenv.env['APP_NAME'] ?? '',
      locale: const Locale('en', 'US'),
      darkTheme: Themefy.darkTheme(context),
      themeMode: Themefy.themeMode(context),
      theme: Themefy.lightTheme(context).copyWith(extensions: [
        ShirneDialogTheme(
            primaryButtonStyle: ButtonStyle(
                foregroundColor: WidgetStateProperty.all(Colors.white))),
      ], visualDensity: VisualDensity.standard),
      defaultTransition: Routefy.defaultTransition,
      initialRoute: Routefy.initial,
      getPages: Routefy.all(),
      unknownRoute: Routefy.unknownRoute,
    );
  }
}
