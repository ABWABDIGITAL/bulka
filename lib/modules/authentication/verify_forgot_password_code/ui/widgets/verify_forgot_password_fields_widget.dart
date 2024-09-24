import 'package:bulka/core/services/servies_locator/service_locator.dart';
import 'package:bulka/modules/authentication/verify_forgot_password_code/data/abstractions/account_forgot_password.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/modules/authentication/choose_verify_method/data/params/choose_verify_method_params.dart';
import 'package:bulka/modules/authentication/verify_forgot_password_code/controllers/verify_forgot_password_cubit.dart';
import 'package:bulka/modules/authentication/verify_phone/controllers/verify_phone_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyForgotPasswordFieldsWidget extends StatelessWidget {
  const VerifyForgotPasswordFieldsWidget(this.accountForgotPassword,
      {super.key});
  final AccountForgotPassword accountForgotPassword;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<VerifyForgotPasswordCubit>();
    return BlocProvider(
      create: (context) => VerifyPhoneCubit(
        params: ChooseVerifyMethodParams(
          email: accountForgotPassword.email ?? "email is null",
          phone: accountForgotPassword.phone ?? "phone is null",
          phoneCode: accountForgotPassword.phoneCode ?? 'phone code is null',
        ),
        verifyPhoneRepo: sl(),
      )..verifyWithPhoneStatesHandled(),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: const Color(0xFF85A0FF)),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        padding: EdgeInsetsDirectional.only(bottom: 5.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(16.r),
              child: Text(
                AppStrings.enterTheCode.tr(),
                style: TextStyles.rubik15W500Primary,
              ),
            ),
            const Divider(thickness: .5),
            PinCodeTextField(
              length: 6,
              obscureText: false,
              animationType: AnimationType.fade,
              autoDisposeControllers: true,
              hapticFeedbackTypes: HapticFeedbackTypes.light,
              useHapticFeedback: true,
              controller: cubit.otpController,
              onChanged: (value) {
                cubit.otpFilled();
              },
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(12.r),
                // fieldHeight: 55.h,
                // fieldWidth: 60.w,
                borderWidth: 1,
                activeBorderWidth: 1,
                inactiveBorderWidth: 1,
                inactiveColor: AppColors.grey,
                inactiveFillColor: AppColors.white,
                activeColor: AppColors.grey,
                selectedColor: AppColors.grey,
                activeFillColor: AppColors.white,
                selectedFillColor: AppColors.white,
              ),
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              animationDuration: const Duration(milliseconds: 300),
              backgroundColor: AppColors.white,
              keyboardType: TextInputType.number,
              enableActiveFill: true,
              textStyle: const TextStyle(color: AppColors.primary),
              errorTextMargin: EdgeInsets.symmetric(horizontal: 16.r),
              appContext: context,
              validator: (value) =>
                  value!.isEmpty ? AppStrings.thisFieldIsRequired.tr() : null,
            ),
          ],
        ),
      ),
    );
  }
}
