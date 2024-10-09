import 'package:bulka/core/shared/widgets/appbar_widget.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/modules/profile_location/controller/profile_location_cubit.dart';
import 'package:bulka/modules/profile_location/view/widgets/delete_location/profile_confirm_delete_location.dart';
import 'package:bulka/modules/profile_location/view/widgets/delete_location/profile_delete_location_list.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileDeleteLocationScreen extends StatelessWidget {
  const ProfileDeleteLocationScreen({super.key});

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
      body: BlocProvider(
        create: (context) => ProfileLocationCubit(),
        child: Padding(
          padding: EdgeInsets.all(24.r),
          child: const Column(
            children: [
              ProfileDeleteLocationsList(),
              ProfileConfirmDeleteLocation()
            ],
          ),
        ),
      ),
    );
  }
}
