import 'dart:io';

import 'package:bulka/core/route/routes.dart';
import 'package:bulka/core/utils/widgets/empty/empty_widget.dart';
import 'package:bulka/modules/splash/ui/screens/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRouter {
  const AppRouter._();
  static Route generateRoute(RouteSettings settings) {
    return getPageRoute(settings: settings);
  }

  static Widget getScreenWidgetByRouteName(String routeName) {
    switch (routeName) {
      case Routes.splash:
        return const SplashScreen();
      default:
        return const EmptyWidget();
    }
  }

  static PageRoute getPageRoute({required RouteSettings settings}) {
    if (Platform.isIOS) {
      return CupertinoPageRoute(
        builder: (_) => getScreenWidgetByRouteName(settings.name!),
        settings: settings,
      );
    } else {
      return MaterialPageRoute(
        builder: (_) => getScreenWidgetByRouteName(settings.name!),
        settings: settings,
      );
    }
  }

  static PageRoute getPageRouteByWidget({required Widget screen}) {
    if (Platform.isIOS) {
      return CupertinoPageRoute(builder: (context) => screen);
    } else {
      return MaterialPageRoute(builder: (context) => screen);
    }
  }
}
