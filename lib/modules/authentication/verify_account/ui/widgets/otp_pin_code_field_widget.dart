import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/modules/authentication/verify_account/controllers/verify_account_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpPinCodeFieldWidget extends StatelessWidget {
  const OtpPinCodeFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<VerifyAccountCubit>();

    return PinCodeTextField(
      length: 5,
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
        fieldHeight: 55.h,
        fieldWidth: 60.w,
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
      // controller: cubit.otpController,
      appContext: context,
      validator: (value) =>
          value!.isEmpty ? AppStrings.thisFieldIsRequired.tr() : null,
    );
  }
}
