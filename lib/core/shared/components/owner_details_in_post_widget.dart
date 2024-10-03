import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class OwnerDetailsInPostWidget extends StatelessWidget {
  const OwnerDetailsInPostWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundImage: NetworkImage(
          'https://s3-alpha-sig.figma.com/img/a358/0c7c/1e35c5bdb1fdfbc222c05e4e3db5d318?Expires=1726444800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=mmrD8xVhT75AxyaglUOe~xCk8FLzA36-GaPX9TkWI9tW-fbe3oBg7fdZqCIb4BaWYpxP7bG24yu12UczFThNisGxGFjiJZ-YziT45tNwV2R9iuPkaBXiBCmuOC1RP1044Pnfyhdzmfck9HQTFuWQ7wpAIHSE8h34lnbqr20VSyo-PzGE3~lMpDOhPsDw~LJaZr9HJfBEUNX8rVPhnOke8yLxhVeEesZtPaXNpdbWYzuEdX-w~HKrfxdm-OCZA5IdjHTwcrScnq~up81CB5J2qPDLJRe9oomfxW-Ayff9Fq6UCLF3dTqyOb1prX6DamDq1UsdzzRmIwwOPtf3dvD0pA__',
        ),
      ),
      title: Text(
        'Mercedes Store',
        style: TextStyles.roboto12W500Black2,
      ),
      subtitle: Text(
        'Just Now',
        style: TextStyles.roboto10W500MediumGrey2,
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AssetIcons.threeDotsSvg,
            height: 6.h,
            width: 18.w,
          )
        ],
      ),
    );
  }
}
