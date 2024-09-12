import 'dart:io';
import 'package:bulka/app/my_app.dart';
import 'package:bulka/core/assets/asset_translations.dart';
import 'package:bulka/core/services/servies_locator/service_locator.dart';
import 'package:bulka/core/utils/constant/strings.dart';
import 'package:bulka/core/utils/widgets/misc/restart_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ServiceLocator().init();
  currentLanguage = await AssetTranslations.getLanguage();
  HttpOverrides.global = MyHttpOverrides();
  EasyLocalization.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then(
    (_) => runApp(
      RestartWidget(
        child: EasyLocalization(
          supportedLocales: [
            AssetTranslations.russian.locale,
            AssetTranslations.emirates.locale,
            AssetTranslations.english.locale,
          ],
          path: AssetTranslations.translationPath,
          saveLocale: true,
          startLocale: currentLanguage?.locale,
          child: const MyApp(),
        ),
      ),
    ),
  );
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
