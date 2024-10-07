import 'dart:ui';

import 'package:equatable/equatable.dart';

class ProfileTileEntity extends Equatable {
  const ProfileTileEntity({
    required this.svgPath,
    required this.title,
    this.svgColor,
    this.onTap,
  });
  final String svgPath;
  final Color? svgColor;
  final String title;
  final void Function()? onTap;

  @override
  List<Object?> get props => [svgPath, svgColor, title, onTap];
}
