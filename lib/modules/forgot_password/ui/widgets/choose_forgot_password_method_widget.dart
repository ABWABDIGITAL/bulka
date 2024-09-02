import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/shared/widgets/build_forgot_password_return_method_circle_widget.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/enums/enums.dart';
import 'package:bulka/core/utils/widgets/form_fields/default_email_form_field_widget.dart';
import 'package:bulka/core/utils/widgets/form_fields/default_phone_form_field.dart';
import 'package:bulka/modules/forgot_password/controllers/forgot_password_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ChooseForgotPasswordMethodWidget extends StatelessWidget {
  const ChooseForgotPasswordMethodWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ForgotPasswordCubit>();
    return BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
      buildWhen: (previous, current) => current is ChooseVerifyMethodChanged,
      builder: (context, state) {
        return Form(
          key: cubit.forgotKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      AppStrings.chooseOneWayToResetYourPassword.tr(),
                      style: TextStyles.rubik13W400IconGrey,
                    ),
                  ),
                  Row(
                    children: [
                      BuildForgotPasswordReturnMethodCircleWidget(
                        onTap: () {
                          cubit.setVerifyAccountMethod(
                            VerifyAccountMethod.phone,
                          );
                        },
                        isSelected: cubit.verifyAccountMethod ==
                                VerifyAccountMethod.phone
                            ? true
                            : false,
                        svgPath: AssetIcons.callSvg,
                      ),
                      hSpace(10),
                      BuildForgotPasswordReturnMethodCircleWidget(
                        onTap: () {
                          cubit.setVerifyAccountMethod(
                            VerifyAccountMethod.email,
                          );
                        },
                        isSelected: cubit.verifyAccountMethod ==
                                VerifyAccountMethod.email
                            ? true
                            : false,
                        svgPath: AssetIcons.smsSvg,
                      ),
                    ],
                  ),
                ],
              ),
              vSpace(25),
              if (cubit.verifyAccountMethod == VerifyAccountMethod.phone)
                AnimatedContainer(
                  duration: 500.ms,
                  child: DefaultPhoneFormField(
                    controller: cubit.phoneController,
                  ),
                ),
              if (cubit.verifyAccountMethod == VerifyAccountMethod.email)
                AnimatedContainer(
                  duration: 500.ms,
                  child: DefaultEmailFormFieldWidget(
                    controller: cubit.emailController,
                  ).animate().fadeIn(),
                ),
            ],
          ),
        );
      },
    );
  }
}
