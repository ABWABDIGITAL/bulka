import 'package:bulka/core/shared/widgets/appbar_widget.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/modules/profile_location/view/widgets/add_location/add_description_form_field.dart';
import 'package:bulka/modules/profile_location/view/widgets/add_location/add_location_button.dart';
import 'package:bulka/modules/profile_location/view/widgets/add_location/add_location_card.dart';
import 'package:bulka/modules/profile_location/view/widgets/add_location/city_drop_down_form_field.dart';
import 'package:bulka/modules/profile_location/view/widgets/add_location/profile_add_location_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileAddLocationScreen extends StatelessWidget {
  const ProfileAddLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(
        title: 'Add Location',
        centerTitle: true,
        titleStyle: TextStyles.rubik14W500Black,
        iconTheme: const IconThemeData(color: AppColors.black),
        backgroundColor: AppColors.opactiyPrimary,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AddLocationCard(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Divider(
                thickness: 3.h,
                color: AppColors.opactiyPrimary,
              ),
            ),
        
            // Choose City Dropdown
            Padding(
              padding: const EdgeInsets.fromLTRB(24.0, 0, 24.0, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CityDropDownFormField(),
                  vSpace(20),
                  const ProfileAddLocationFormField(),
                  vSpace(20),
                  const AddLocationDescriptionFormField(),
                  vSpace(100),
                  const AddLocationButton()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
