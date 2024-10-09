import 'package:bulka/core/assets/asset_images.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchNoResultFoundScreen extends StatelessWidget {
  const SearchNoResultFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 34),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AssetImages.noResultFound,
            height: 128.h,
            width: 102.w,
          ),
          vSpace(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "No results found",
                style: TextStyles.rubik18W600Black,
              ),
            ],
          ),
          vSpace(10),
          Text(
            'no results for what you are looking for. Try again with another word or contact support.'
                .tr(),
            style: TextStyles.rubik14W400MediumGrey4,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
