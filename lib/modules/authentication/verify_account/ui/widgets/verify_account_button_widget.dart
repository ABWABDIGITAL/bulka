import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/widgets/buttons/default_button.dart';
import 'package:bulka/core/utils/widgets/dialogs/dialogs.dart';
import 'package:bulka/modules/authentication/verify_account/controllers/verify_account_cubit.dart';
import 'package:bulka/modules/authentication/verify_account/controllers/verify_account_state.dart';
import 'package:bulka/modules/authentication/verify_account/ui/widgets/verify_success_bottom_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerifyAccountButtonWidget extends StatelessWidget {
  const VerifyAccountButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<VerifyAccountCubit>();

    return BlocConsumer<VerifyAccountCubit, VerifyAccountState>(
      listenWhen: (previous, current) =>
          current is VerifyOtpLoading ||
          current is VerifyOtpSuccess ||
          current is VerifyOtpError,
      listener: (context, state) {
        if (state is VerifyOtpSuccess) {
          // Dialogs.successDialog(context);
        }
        if (state is VerifyOtpError) {
          Dialogs.errorDialog(context: context, error: state.error);
        }
      },
      buildWhen: (previous, current) =>
          current is VerifyAccountOtpFilled ||
          current is VerifyOtpLoading ||
          current is VerifyOtpSuccess ||
          current is VerifyOtpError,
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.r),
          child: DefaultButton(
            text: AppStrings.verify.tr(),
            elevation: cubit.isOtpFilled ? 1 : 0,
            backgroundColor:
                cubit.isOtpFilled ? AppColors.primary : AppColors.mediumGrey,
            isLoading: state is VerifyOtpLoading ? true : false,
            textColor:
                cubit.isOtpFilled ? AppColors.white : AppColors.mediumGrey2,
            onPressed: () {
              verifySuccessBottomWidget(context);
            },
          ),
        );
      },
    );
  }
}
