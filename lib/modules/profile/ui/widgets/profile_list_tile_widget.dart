import 'package:bulka/core/assets/asset_translations.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/modules/profile/data/entities/profile_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ProfileListTileWidget extends StatelessWidget {
  final ProfileTileEntity tile;
  const ProfileListTileWidget({
    super.key,
    required this.tile,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(onTap: tile.onTap,
      leading: Container(
        height: 48.h,
        width: 48.w,
        decoration: BoxDecoration(
          color: AppColors.opactiyPrimary,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              tile.svgPath,
              color: tile.svgColor,
              height: 22,
              width: 22,
            ),
          ],
        ),
      ),
      title: Text(
        tile.title,
        style: TextStyles.rubik13W600Black4,
      ),
      trailing: AssetTranslations.isRightDirectionality
          ? const Icon(Icons.arrow_back_ios, size: 16)
          : const Icon(Icons.arrow_forward_ios, size: 16),
    );
  }
}
