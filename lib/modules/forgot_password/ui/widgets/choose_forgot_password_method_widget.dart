import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/enums/enums.dart';
import 'package:bulka/modules/forgot_password/controllers/forgot_password_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ChooseForgotPasswordMethodWidget extends StatelessWidget {
  const ChooseForgotPasswordMethodWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ForgotPasswordCubit>();
    return Row(
      children: [
        Expanded(
          child: Text(
            AppStrings.chooseOneWayToResetYourPassword.tr(),
            style: TextStyles.rubik13W400IconGrey,
          ),
        ),
        BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
          buildWhen: (previous, current) =>
              current is ChooseVerifyMethodChanged,
          builder: (context, state) {
            return Row(
              children: [
                buildCircleAvatar(
                  onTap: () {
                    cubit.setVerifyAccountMethod(VerifyAccountMethod.phone);
                  },
                  isSelected:
                      cubit.verifyAccountMethod == VerifyAccountMethod.phone
                          ? true
                          : false,
                  svgPath: AssetIcons.callSvg,
                ),
                hSpace(10),
                buildCircleAvatar(
                  onTap: () {
                    cubit.setVerifyAccountMethod(VerifyAccountMethod.email);
                  },
                  isSelected:
                      cubit.verifyAccountMethod == VerifyAccountMethod.email
                          ? true
                          : false,
                  svgPath: AssetIcons.smsSvg,
                ),
              ],
            );
          },
        )
      ],
    );
  }

  Widget buildCircleAvatar({
    required void Function()? onTap,
    required bool isSelected,
    required String svgPath,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: isSelected ? AppColors.primary : AppColors.softGrey1,
        radius: 23.r,
        child: CircleAvatar(
          radius: 22.r,
          backgroundColor: isSelected ? AppColors.primary : AppColors.grey,
          child: SvgPicture.asset(
            svgPath,
            color: isSelected ? AppColors.white : AppColors.mediumGrey5,
          ),
        ),
      ),
    );
  }
}
