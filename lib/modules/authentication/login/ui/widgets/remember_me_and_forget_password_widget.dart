import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/extensions/extensions.dart';
import 'package:bulka/modules/authentication/forgot_password/ui/views/forgot_password_screen.dart';
import 'package:bulka/modules/authentication/login/controllers/login_cubit.dart';
import 'package:bulka/modules/authentication/login/controllers/login_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RememberMeAndForgetPasswordWidget extends StatelessWidget {
  const RememberMeAndForgetPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.r),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                BlocBuilder<LoginCubit, LoginState>(
                  buildWhen: (previous, current) =>
                      current is ChangeRememberMeStatus,
                  builder: (context, state) {
                    return Checkbox.adaptive(
                      value: cubit.isRememberMe,
                      activeColor: AppColors.primary,
                      visualDensity:
                          const VisualDensity(vertical: 0, horizontal: -4),
                      checkColor: AppColors.white,
                      fillColor: WidgetStateProperty.resolveWith<Color>(
                          (Set<WidgetState> states) {
                        if (states.contains(WidgetState.selected)) {
                          return AppColors.primary;
                        }
                        return Colors.white;
                      }),
                      onChanged: (value) {
                        cubit.changeRememberMe();
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
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.only(bottom: 4.r),
                    child: Text(
                      AppStrings.rememberMe.tr(),
                      style: TextStyles.rubik13W400IconGrey,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                context.push(const ForgotPasswordScreen());
              },
              child: Text(
                "${AppStrings.forgetPassword.tr()}!",
                style: TextStyles.rubik13W500Primary.copyWith(
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.primary,
                ),
                textAlign: TextAlign.end,
              ),
            ),
          )
        ],
      ),
    );
  }
}
