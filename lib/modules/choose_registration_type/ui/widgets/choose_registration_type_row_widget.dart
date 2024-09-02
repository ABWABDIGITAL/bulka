import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/enums/enums.dart';
import 'package:bulka/modules/choose_registration_type/controllers/choose_registeration_type_cubit.dart';
import 'package:bulka/modules/choose_registration_type/controllers/choose_registeration_type_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChooseRegistrationTypeRowWidget extends StatelessWidget {
  const ChooseRegistrationTypeRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ChooseRegisterationTypeCubit>();
    return BlocBuilder<ChooseRegisterationTypeCubit,
        ChooseRegisterationTypeState>(
      buildWhen: (previous, current) => current is ChangeUserRoleStatus,
      builder: (context, state) {
        return Row(
          children: [
            Expanded(
              child: chooseTypeContainer(
                imagePath: AssetIcons.personFill,
                text: AppStrings.user.tr(),
                isSelected: cubit.userRole == UserRole.user ? true : false,
                onTap: () {
                  cubit.changeUserRole(UserRole.user);
                },
              ),
            ),
            Expanded(
              child: chooseTypeContainer(
                imagePath: cubit.userRole == UserRole.company
                    ? AssetIcons.building
                    : AssetIcons.greyBuilding,
                text: AppStrings.company.tr(),
                isSelected: cubit.userRole == UserRole.company ? true : false,
                onTap: () {
                  cubit.changeUserRole(UserRole.company);
                },
              ),
            ),
          ],
        );
      },
    );
  }

  Widget chooseTypeContainer({
    required bool isSelected,
    required String imagePath,
    required String text,
    void Function()? onTap,
  }) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        AnimatedContainer(
          height: 140.h,
          width: 140.w,
          decoration: isSelected
              ? const BoxDecoration(
                  color: Color(0xFF2465CD),
                  shape: BoxShape.circle,
                )
              : BoxDecoration(
                  color: AppColors.white,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.darkGrey3,
                  ),
                ),
          padding: EdgeInsets.all(12.r),
          duration: 300.ms,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(100.r),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  imagePath,
                  height: 40.h,
                  width: 40.w,
                  fit: BoxFit.contain,
                ),
                Text(
                  text,
                  style: isSelected
                      ? TextStyles.popins18W500White
                      : TextStyles.popins18W500DardGey3,
                )
              ],
            ),
          ),
        ),
        if (isSelected)
          Transform.translate(
            offset: Offset(0, 20.h),
            child: CircleAvatar(
              backgroundColor: AppColors.primary,
              radius: 15.r,
              child: Icon(
                CupertinoIcons.check_mark,
                color: AppColors.white,
                size: 15.r,
              ),
            ),
          )
      ],
    );
  }
}
