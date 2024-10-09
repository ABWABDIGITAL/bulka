import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';

class PostDetailsDividerWidget extends StatelessWidget {
  const PostDetailsDividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: AppColors.opactiyPrimary,
      height: 3,
      thickness: 3,
    );
  }
}
