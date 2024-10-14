import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/modules/posts/data/entity/post_details_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class OwnerDetailsInPostWidget extends StatelessWidget {
  const OwnerDetailsInPostWidget(
    this.post, {
    super.key,
  });
  final PostDetailsEntity post;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(post.adDetailsEntity.mainInfo.image),
      ),
      title: Text(
        post.adDetailsEntity.mainInfo.user.fullName,
        style: TextStyles.roboto12W500Black2,
      ),
      subtitle: Text(
        post.adDetailsEntity.mainInfo.user.fullName,
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
