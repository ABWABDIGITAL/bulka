import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/enums/enums.dart';
import 'package:bulka/modules/choose_verify_method/controllers/choose_verify_method_cubit.dart';
import 'package:bulka/modules/choose_verify_method/controllers/choose_verify_method_state.dart';
import 'package:bulka/modules/choose_verify_method/data/params/choose_verify_method_params.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChooseVerifyMethodWidget extends StatelessWidget {
  const ChooseVerifyMethodWidget(this.params, {super.key});
  final ChooseVerifyMethodParams params;
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ChooseVerifyMethodCubit>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.r),
      child: BlocBuilder<ChooseVerifyMethodCubit, ChooseVerifyMethodState>(
        buildWhen: (previous, current) => current is ChooseVerifyMethodChanged,
        builder: (context, state) {
          return Column(
            children: [
              buildListTileWidget(
                leading: AssetIcons.smstracking,
                title: AppStrings.sms.tr(),
                subtitle: params.email,
                isSelected:
                    cubit.verifyAccountMethod == VerifyAccountMethod.email
                        ? true
                        : false,
                onTap: () {
                  cubit.setVerifyAccountMethod(VerifyAccountMethod.email);
                },
              ),
              vSpace(20),
              buildListTileWidget(
                leading: AssetIcons.call,
                title: AppStrings.phoneNumber.tr(),
                subtitle: params.phone,
                isSelected:
                    cubit.verifyAccountMethod == VerifyAccountMethod.phone
                        ? true
                        : false,
                onTap: () {
                  cubit.setVerifyAccountMethod(VerifyAccountMethod.phone);
                },
              )
            ],
          );
        },
      ),
    );
  }

  Widget buildListTileWidget({
    required String leading,
    required String title,
    required String subtitle,
    required bool isSelected,
    required void Function()? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: AppColors.grey,
          ),
        ),
        // padding: ,
        child: ListTile(
          leading: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(
                color: AppColors.grey,
              ),
            ),
            padding: EdgeInsets.all(20.r),
            child: Image.asset(
              leading,
              height: 24.h,
              width: 24.w,
            ),
          ),
          title: Text(
            title,
            style: TextStyles.rubik15W500Black,
          ),
          subtitle: Text(
            subtitle,
            style: TextStyles.rubik14W400MediumGrey3,
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (isSelected)
                Image.asset(
                  AssetIcons.checkGreen,
                  height: 24.h,
                  width: 24.w,
                ),
              if (!isSelected)
                Image.asset(
                  AssetIcons.unselected,
                  height: 24.h,
                  width: 24.w,
                )
            ],
          ),
        ),
      ),
    );
  }
}
