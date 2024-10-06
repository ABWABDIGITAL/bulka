import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

class BadgeIconWidget extends StatelessWidget {
  const BadgeIconWidget({this.child, this.onTap, super.key});
  final Widget? child;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return badges.Badge(
      position: badges.BadgePosition.topEnd(top: -10, end: -6),
      showBadge: true,
      ignorePointer: false,
      badgeAnimation: const badges.BadgeAnimation.rotation(
        animationDuration: Duration(seconds: 1),
        colorChangeAnimationDuration: Duration(seconds: 1),
        loopAnimation: false,
        curve: Curves.fastOutSlowIn,
        colorChangeAnimationCurve: Curves.easeInCubic,
      ),
      badgeContent: Text(
        '1',
        style: TextStyles.rubik12W700White,
      ),
      badgeStyle: badges.BadgeStyle(
        shape: badges.BadgeShape.circle,
        badgeColor: HexColor('#338BE4'),
        padding: const EdgeInsets.all(3),
      ),
      child: InkWell(
        onTap: () {},
        child: SvgPicture.asset(
          AssetIcons.bellSvg,
          height: 20.h,
          width: 20.w,
        ),
      ),
    );
  }
}
