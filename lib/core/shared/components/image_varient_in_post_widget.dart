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
            'https://s3-alpha-sig.figma.com/img/641e/cf2d/21a295503e6558162eb7df97e7ba0a23?Expires=1726444800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=Ln4zB1-sIalmUQg8tlyWAFoDSgmfOpATT4tx~FLXFUGjr4fmZ5dUzJrDbu4QWgYWhGAAkRpPooH8G-QZOUKADFX7AH-50NLO~QZN~4axsCI78dBJpC3s~F2jWntVOMoZuCrA~VHIqfOk~Muk0OOYuVoSC7SZ7hTvYQrh2nTnEQ4rxydWk1hXm9M~-KoMTg2bOIiGSR4SGtHAaP2wko9W1oWrjupSo-dRM8RtwS~BbVLhiPyYORcnYUY0voQ3ils9HM2M7MJ2lEWFAkcc4AErXu~jjwjQSNYBm7IIW2MhMKkvmbD~dlRF5svZ-jPnkz2oQOZq1do4w9kuDpADrbzDlw__',
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
