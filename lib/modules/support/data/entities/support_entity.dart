import 'dart:ui';

import 'package:equatable/equatable.dart';

class SupportEntity extends Equatable {
  final String icon;
  final String title;
  final String description;
  final VoidCallback onTap;

  const SupportEntity(
      {required this.icon,
      required this.title,
      required this.description,
      required this.onTap});
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
