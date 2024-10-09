import 'package:bulka/core/shared/widgets/appbar_widget.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/extensions/extensions.dart';
import 'package:bulka/core/utils/widgets/buttons/default_button.dart';
import 'package:bulka/modules/profile_location/view/screens/profile_delete_location_screen.dart';
import 'package:bulka/modules/profile_location/view/widgets/all_locations/profile_all_locations_list.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileAllLocationsScreen extends StatelessWidget {
  const ProfileAllLocationsScreen({super.key});

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
        padding: EdgeInsets.all(24.r),
        child: Column(
          children: [
            const ProfileAllLocationsList(),
            DefaultButton(
              text: AppStrings.delete.tr(),
              onPressed: () {
                context.push(const ProfileDeleteLocationScreen());
              },
              backgroundColor: AppColors.opactiyPrimary,
              textColor: AppColors.primary,
              borderColor: AppColors.primary200,
            ),
            vSpace(8),
            DefaultButton(
              text: AppStrings.addLocation.tr(),
            )
          ],
        ),
      ),
    );
  }
}
