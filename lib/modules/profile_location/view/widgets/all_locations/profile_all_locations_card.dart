import 'package:bulka/core/assets/asset_images.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileAllLocationsCard extends StatelessWidget {
  const ProfileAllLocationsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 115.h,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.darkGrey2),
      ),
      child: Row(
        children: [
          Container(
            height: 90.h,
            width: 130.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              image: const DecorationImage(
                  image: AssetImage(AssetImages.map2), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Image.asset(
              AssetImages.addLocationMarker,
              height: 15,
            ),
          ),
          hSpace(8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Work', style: TextStyles.rubik14W500Black),
                Expanded(
                    child: Text(
                  '33, el salam street, Cairo, Egypt',
                  style: TextStyles.rubik13W400IconGrey,
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
