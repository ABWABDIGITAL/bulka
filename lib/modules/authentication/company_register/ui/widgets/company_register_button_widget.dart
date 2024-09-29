import 'package:bulka/core/shared/abstractions/account_verification.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/extensions/extensions.dart';
import 'package:bulka/core/utils/widgets/buttons/default_button.dart';
import 'package:bulka/core/utils/widgets/dialogs/dialogs.dart';
import 'package:bulka/modules/authentication/choose_verify_method/data/params/choose_verify_method_params.dart';
import 'package:bulka/modules/authentication/choose_verify_method/ui/views/choose_verify_method_screen.dart';
import 'package:bulka/modules/authentication/company_register/controllers/company_register_cubit.dart';
import 'package:bulka/modules/authentication/company_register/controllers/company_register_state.dart';
import 'package:bulka/modules/authentication/verify_phone/ui/views/verify_phone_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CompanyRegisterButtonWidget extends StatelessWidget {
  const CompanyRegisterButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CompanyRegisterCubit>();

    return BlocConsumer<CompanyRegisterCubit, CompanyRegisterState>(
      listenWhen: (previous, current) =>
          current is CompanyRegisterLoading ||
          current is CompanyRegisterSuccess ||
          current is CompanyRegisterError,
      listener: (context, state) {
        if (state is CompanyRegisterError) {
          Dialogs.errorDialog(context: context, error: state.error);
        }
        if (state is CompanyRegisterSuccess) {
          Dialogs.customeToast(
            text: state.company.message,
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
          current is CompanyRegisterLoading ||
          current is CompanyRegisterSuccess ||
          current is CompanyRegisterError,
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.r),
          child: DefaultButton(
            borderRadiusValue: 12.r,
            onPressed: () async {
              bool isValid = false;
              if (cubit.companyKey.currentState!.validate()) {
                cubit.companyKey.currentState!.save();
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
              }
              if (isValid && cubit.agreePolicyAndConditions) {
                cubit.companyRegisterStatesHandled();
              }
            },
            text: AppStrings.signUp.tr(),
            isLoading: state is CompanyRegisterLoading ? true : false,
          ),
        );
      },
    );
  }
}
