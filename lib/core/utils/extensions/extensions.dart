import 'package:bulka/core/route/app_router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

extension Navigation on BuildContext {
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> push(Widget screen) {
    return Navigator.of(this)
        .push(AppRouter.getPageRouteByWidget(screen: screen));
  }

  Future<dynamic> pushOffAll(Widget screen) {
    return Navigator.of(this).pushAndRemoveUntil(
      AppRouter.getPageRouteByWidget(screen: screen),
      (route) => false,
    );
  }

  Future<dynamic> pushReplacement(Widget screen, {Object? arguments}) {
    return Navigator.of(this)
        .pushReplacement(AppRouter.getPageRouteByWidget(screen: screen));
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this)
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(String routeName,
      {Object? arguments,
      required RoutePredicate predicate,
      bool? rootNavigator}) {
    return Navigator.of(this, rootNavigator: rootNavigator ?? false)
        .pushNamedAndRemoveUntil(routeName, predicate, arguments: arguments);
  }

  void popUntilToNamed(String routeName) {
    return Navigator.of(this).popUntil(ModalRoute.withName(routeName));
  }

  void pop() => Navigator.of(this).pop();
}
