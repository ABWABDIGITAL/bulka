import 'package:flutter/material.dart';

class Move {
  static pop(BuildContext context) => Navigator.pop(context);
  static navigateToZoom(
    BuildContext context,
    Widget child,
  ) =>
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => child,
          ));
  static navigateToDownToUp(
    BuildContext context,
    Widget child, {
    int? millisecond,
  }) =>
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => child,
          ));

  static navigateToFade(
    BuildContext context,
    Widget child, {
    int? millisecond,
  }) =>
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => child,
          ));

  static navigateToRotate(
    BuildContext context,
    Widget child, {
    int? millisecond,
  }) =>
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => child,
          ));

  static nativeNavigatePush(context, Widget child) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => child,
      ));
  static navigatorAllOff(context, Widget child) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => child,
      ),
      (route) => false);
  static navigatorReplacement(context, Widget child) =>
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => child,
          ));
}
