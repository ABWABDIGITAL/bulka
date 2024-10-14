import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/extensions/extensions.dart';
import 'package:bulka/core/utils/widgets/buttons/default_button.dart';
import 'package:bulka/core/utils/widgets/dialogs/dialogs.dart';
import 'package:bulka/modules/authentication/choose_verify_method/data/params/choose_verify_method_params.dart';
import 'package:bulka/modules/authentication/choose_verify_method/ui/views/choose_verify_method_screen.dart';
import 'package:bulka/modules/authentication/user_register/controllers/user_register_cubit.dart';
import 'package:bulka/modules/authentication/user_register/controllers/user_register_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserRegisterButtonWidget extends StatelessWidget {
  const UserRegisterButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UserRegisterCubit>();

    return BlocConsumer<UserRegisterCubit, UserRegisterState>(
      listenWhen: (previous, current) =>
          current is UserRegisterLoading ||
          current is UserRegisterSuccess ||
          current is UserRegisterError,
      listener: (context, state) {
        if (state is UserRegisterError) {
          Dialogs.errorDialog(context: context, error: state.error);
        }
        if (state is UserRegisterSuccess) {
          Dialogs.customeToast(
            text: state.user.message,
            context: context,
            isSuccess: true,
          );
          context.push(
            ChooseVerifyMethodScreen(
              ChooseVerifyMethodParams(
                email: cubit.emailController.text,
                phone: cubit.phoneController.text,
                phoneCode: cubit.phoneCodeController.text,
              ),
            ),
          );
        }
      },
      buildWhen: (previous, current) =>
          current is UserRegisterLoading ||
          current is UserRegisterSuccess ||
          current is UserRegisterError,
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.r),
          child: DefaultButton(
            borderRadiusValue: 12.r,
            onPressed: () async {
              bool isValid = false;
              if (cubit.userRegisterKey.currentState!.validate()) {
                cubit.userRegisterKey.currentState!.save();
                FocusScope.of(context).unfocus();
                isValid = true;
              }
              if (!isValid) {
                return;
              }
              if (!cubit.agreePolicyAndConditions) {
                Dialogs.customeToast(
                  text: AppStrings.pleaseAgreeOurTermsAndConditionsFirst.tr(),
                  context: context,
                  isSuccess: false,
                );
                return;
              }
              if (isValid && cubit.agreePolicyAndConditions) {
                cubit.userRegisterStatesHandled();
                // context.push(
                //   const ChooseVerifyMethodScreen(
                //     ChooseVerifyMethodParams(
                //       email: 'test@test.com',
                //       phone: '1234567890',
                //     ),
                //   ),
                // );
              }
            },
            text: AppStrings.signUp.tr(),
            isLoading: state is UserRegisterLoading ? true : false,
          ),
        );
      },
    );
  }
}
