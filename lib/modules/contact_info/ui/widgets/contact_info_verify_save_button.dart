import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/extensions/extensions.dart';
import 'package:bulka/core/utils/widgets/buttons/default_button.dart';
import 'package:bulka/core/utils/widgets/dialogs/dialogs.dart';
import 'package:bulka/modules/contact_info/controllers/contact_info_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactInfoVerifyButton extends StatelessWidget {
  const ContactInfoVerifyButton({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ContactInfoCubit>();

    return BlocConsumer<ContactInfoCubit, ContactInfoState>(
      listenWhen: (previous, current) =>
          current is ContactInfoVerifyPhoneOtpLoading ||
          current is ContactInfoVerifyPhoneOtpSuccess ||
          current is ContactInfoVerifyPhoneOtpError,
      listener: (context, state) {
        if (state is ContactInfoVerifyPhoneOtpSuccess) {
          context.pop();
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(state.message),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(AppStrings.ok.tr()),
                ),
              ],
            ),
          );
        }
        if (state is ContactInfoVerifyPhoneOtpError) {
          Dialogs.errorDialog(context: context, error: state.error);
        }
      },
      buildWhen: (previous, current) =>
          current is ContactInfoVerifyPhoneOtpFilled ||
          current is ContactInfoVerifyPhoneOtpLoading ||
          current is ContactInfoVerifyPhoneOtpSuccess ||
          current is ContactInfoVerifyPhoneOtpError,
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.r),
          child: DefaultButton(
            text: AppStrings.verify.tr(),
            elevation: cubit.isOtpFilled ? 1 : 0,
            backgroundColor:
                cubit.isOtpFilled ? AppColors.primary : AppColors.mediumGrey,
            isLoading: state is ContactInfoVerifyPhoneOtpLoading ? true : false,
            textColor:
                cubit.isOtpFilled ? AppColors.white : AppColors.mediumGrey2,
            onPressed: () {
              if (cubit.formKey.currentState!.validate()) {
                cubit.formKey.currentState!.save();
                cubit.verifyUpdatedPhone();
              }
            },
          ),
        );
      },
    );
  }
}
