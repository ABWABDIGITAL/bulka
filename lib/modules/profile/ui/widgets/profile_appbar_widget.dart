import 'package:bulka/core/shared/widgets/appbar_widget.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';

class ProfileAppbarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const ProfileAppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomeAppBarWidget(
      height: 0,
      statusbarColor: AppColors.primary300,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(0);
}
