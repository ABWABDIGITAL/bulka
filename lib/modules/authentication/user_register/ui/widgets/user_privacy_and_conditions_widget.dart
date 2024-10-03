import 'package:bulka/core/shared/widgets/privacy_policy_screen.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/extensions/extensions.dart';
import 'package:bulka/modules/authentication/user_register/controllers/user_register_cubit.dart';
import 'package:bulka/modules/authentication/user_register/controllers/user_register_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserPrivacyAndConditionsWidget extends StatelessWidget {
  const UserPrivacyAndConditionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UserRegisterCubit>();

    return Padding(
      padding: EdgeInsetsDirectional.only(start: 10.r),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          BlocBuilder<UserRegisterCubit, UserRegisterState>(
            buildWhen: (previous, current) =>
                current is ChangeAgreePolicyAndConditions,
            builder: (context, state) {
              return Checkbox.adaptive(
                value: cubit.agreePolicyAndConditions,
                activeColor: AppColors.primary,
                checkColor: AppColors.white,
                fillColor: WidgetStateProperty.resolveWith<Color>(
                    (Set<WidgetState> states) {
                  if (states.contains(WidgetState.selected)) {
                    return AppColors.primary;
                  }
                  return Colors.white;
                }),
                onChanged: (value) {
                  cubit.changeAgreePolicyAndConditions();
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.r),
                  side: const BorderSide(color: AppColors.grey),
                ),
                side: const BorderSide(
                  color: AppColors.grey,
                  width: 1,
                ),
              );
            },
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(bottom: 2.r),
            child: TextButton(
              onPressed: () {
                context.push(const PrivacyPolicy());
              },
              child: Text(
                AppStrings.agreetothetermsandconditions.tr(),
                style: TextStyles.rubik13W400IconGrey,
                textAlign: TextAlign.start,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
