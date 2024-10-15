import 'dart:io';
import 'package:bulka/app/my_app.dart';
import 'package:bulka/core/assets/asset_translations.dart';
import 'package:bulka/core/services/cache/shared_pref.dart';
import 'package:bulka/core/services/network/dio_helper.dart';
import 'package:bulka/core/services/notifications/firebase_notification_api.dart';
import 'package:bulka/core/services/ob_servable/ob_server.dart';
import 'package:bulka/core/services/servies_locator/service_locator.dart';
import 'package:bulka/core/utils/constant/strings.dart';
import 'package:bulka/core/utils/widgets/misc/restart_widget.dart';
import 'package:bulka/firebase_options.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await ServiceLocator().init();
  await SharedPrefHelper.init();
  await ScreenUtil.ensureScreenSize();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  currentLanguage = await AssetTranslations.getLanguage();
  Bloc.observer = MyBlocObserver();
  HttpOverrides.global = MyHttpOverrides();
  EasyLocalization.ensureInitialized();
  FirebaseNotificationApi().initNotification();
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
