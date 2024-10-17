import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/extensions/extensions.dart';
import 'package:bulka/core/utils/widgets/misc/default_network_image.dart';
import 'package:bulka/modules/ad_details_modules/post_details/ui/views/post_details_screen.dart';
import 'package:bulka/modules/posts/data/entity/post_details_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageVarientInPostWidget extends StatelessWidget {
  const ImageVarientInPostWidget(this.post, {super.key});
  final PostDetailsEntity post;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(const PostDetailsScreen());
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.r),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            DefaultNetworkImage(
              post.adDetailsEntity.mainInfo.image,
              height: 268.h,
              width: MediaQuery.sizeOf(context).width,
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 10.r,
              child: Container(
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.7),
                      offset: const Offset(0, 5),
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    varientItem(
                      path: AssetIcons.speedoMeter2Svg,
                      text: '5k-10k',
                    ),
                    varientItem(
                      path: AssetIcons.calenderSvg,
                      text: '2023',
                    ),
                    varientItem(
                      path: AssetIcons.unlockSvg,
                      text: 'Used',
                    ),
                    varientItem(
                      path: AssetIcons.unlockSvg,
                      text: 'Fabrika',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget varientItem({
    required final String path,
    required final String text,
  }) {
    return Row(
      children: [
        SvgPicture.asset(
          path,
          height: 18.h,
          width: 18.w,
          color: AppColors.white,
        ),
        hSpace(7),
        Text(
          text,
          style: TextStyles.roboto12W500SoftGrey3,
        )
      ],
    );
  }
}
