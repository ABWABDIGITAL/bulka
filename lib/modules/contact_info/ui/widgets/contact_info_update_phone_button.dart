import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/extensions/extensions.dart';
import 'package:bulka/core/utils/widgets/dialogs/dialogs.dart';
import 'package:bulka/core/utils/widgets/loading/adaptive_circuler.dart';
import 'package:bulka/modules/contact_info/controllers/contact_info_cubit.dart';
import 'package:bulka/modules/contact_info/ui/views/contact_info_verify_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactInfoUpdatePhoneButton extends StatelessWidget {
  const ContactInfoUpdatePhoneButton({
    super.key,
    required this.cubit,
  });

  final ContactInfoCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ContactInfoCubit, ContactInfoState>(
      listenWhen: (previous, current) =>
          current is ContactInfoUpdatePhoneLoading ||
          current is ContactInfoUpdatePhoneSuccess ||
          current is ContactInfoUpdatePhoneError ||
          current is ContactInfoCheckPhoneValue,
      listener: (context, state) {
        if (state is ContactInfoUpdatePhoneSuccess) {
          context.push(
            ContactInfoVerifyScreen(
              cubit: cubit,
            ),
          );
        }
        if (state is ContactInfoUpdatePhoneError) {
          Dialogs.errorDialog(context: context, error: state.error);
        }
      },
      buildWhen: (previous, current) =>
          current is ContactInfoUpdatePhoneLoading ||
          current is ContactInfoUpdatePhoneSuccess ||
          current is ContactInfoUpdatePhoneError ||
          current is ContactInfoCheckPhoneValue,
      builder: (context, state) {
        return TextButton(
          onPressed: cubit.isUpdatedPhone
              ? () {
                  if (cubit.formKey.currentState!.validate()) {
                    cubit.formKey.currentState!.save();

                    cubit.updatePhone();
                  }
                }:null,
          child: (state is ContactInfoUpdatePhoneLoading)
              ? const AdaptiveCircularProgress()
              : Text(
                  AppStrings.save.tr(),
                  style: cubit.isUpdatedPhone
                      ? TextStyles.rubik14W600Primary
                      : TextStyles.rubik14W400MediumGrey5,
                ),
        );
      },
    );
  }
}
