import 'package:bulka/core/assets/asset_icons.dart';
import 'package:flutter/material.dart';

class LogoLoadingWidget extends StatelessWidget {
  const LogoLoadingWidget({
    super.key,
    this.height,
    this.width,
  });
  final double? height;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        AssetIcons.appTransparentIconX4,
        height: height ?? 100,
        width: width ?? 100,
      ),
    );
  }
}
