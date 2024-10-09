import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/widgets/misc/default_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageVarientInPostWidget extends StatelessWidget {
  const ImageVarientInPostWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.r),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          DefaultNetworkImage(
            'https://images.unsplash.com/photo-1624187376425-623defd09ce0?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTZ8fEclMjBDTEFTU3xlbnwwfHwwfHx8MA%3D%3D',
            height: 268.h,
            width: MediaQuery.sizeOf(context).width,
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 10.r, // Adjust the position as needed
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(
                        0.7), // Adjust opacity for shadow intensity
                    offset: const Offset(0, 5), // Vertical offset of shadow
                    blurRadius: 8, // Blur radius of shadow
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
