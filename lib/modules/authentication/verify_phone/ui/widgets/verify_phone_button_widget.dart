import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/extensions/extensions.dart';
import 'package:bulka/core/utils/home_utilites.dart';
import 'package:bulka/core/utils/widgets/buttons/default_button.dart';
import 'package:bulka/core/utils/widgets/dialogs/dialogs.dart';
import 'package:bulka/modules/authentication/verify_phone/controllers/verify_phone_cubit.dart';
import 'package:bulka/modules/authentication/verify_phone/controllers/verify_phone_state.dart';
import 'package:bulka/modules/authentication/verify_phone/ui/widgets/verify_success_bottom_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerifyPhoneButtonWidget extends StatelessWidget {
  const VerifyPhoneButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<VerifyPhoneCubit>();

    return BlocConsumer<VerifyPhoneCubit, VerifyPhoneState>(
      listenWhen: (previous, current) =>
          current is VerifyPhoneOtpLoading ||
          current is VerifyPhoneOtpSuccess ||
          current is VerifyPhoneOtpError,
      listener: (context, state) {
        if (state is VerifyPhoneOtpSuccess) {
          saveToken(state.verify.token).then(
            (_) => Dialogs.successDialog(
              context,
              onSuccessFinishedCallback: (p0) {
                context.pop();
                verifySuccessBottomWidget(context);
              },
            ),
          );
        }
        if (state is VerifyPhoneOtpError) {
          Dialogs.errorDialog(context: context, error: state.error);
        }
      },
      buildWhen: (previous, current) =>
          current is VerifyPhoneOtpFilled ||
          current is VerifyPhoneOtpLoading ||
          current is VerifyPhoneOtpSuccess ||
          current is VerifyPhoneOtpError,
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.r),
          child: DefaultButton(
            text: AppStrings.verify.tr(),
            elevation: cubit.isOtpFilled ? 1 : 0,
            backgroundColor:
                cubit.isOtpFilled ? AppColors.primary : AppColors.mediumGrey,
            isLoading: state is VerifyPhoneOtpLoading ? true : false,
            textColor:
                cubit.isOtpFilled ? AppColors.white : AppColors.mediumGrey2,
            onPressed: () {
              if (cubit.verifyKey.currentState!.validate()) {
                cubit.verifyKey.currentState!.save();
                cubit.verifyWithPhoneStatesHandled();
              }
            },
          ),
        );
      },
    );
  }
}
