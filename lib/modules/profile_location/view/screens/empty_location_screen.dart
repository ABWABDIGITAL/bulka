import 'package:bulka/core/assets/asset_images.dart';
import 'package:bulka/core/shared/widgets/appbar_widget.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/modules/profile_location/view/widgets/empty_location/profile_empty_location_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileEmptyLocatoinScreen extends StatelessWidget {
  const ProfileEmptyLocatoinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(
        title: AppStrings.location.tr(),
        centerTitle: true,
        titleStyle: TextStyles.rubik14W500Black,
        iconTheme: const IconThemeData(color: AppColors.black),
        backgroundColor: AppColors.opactiyPrimary,
      ),
      body: Padding(
        padding: EdgeInsets.all(24.0.r),
        child: Column(
          children: [
            Image.asset(AssetImages.emptyLocation),
            Text(AppStrings.noLocationAdded.tr(),
                style: TextStyles.rubik14W500Black),
            Text(AppStrings.addAnAddress.tr(),
                style: TextStyles.rubik16W400MediumGrey10),
            const Spacer(),
            const ProfileEmptyLocationButton()
          ],
        ),
      ),
    );
  }
}
