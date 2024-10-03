import 'package:bulka/core/shared/widgets/appbar_widget.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/modules/authentication/choose_verify_method/controllers/choose_verify_method_cubit.dart';
import 'package:bulka/modules/authentication/choose_verify_method/data/params/choose_verify_method_params.dart';
import 'package:bulka/modules/authentication/choose_verify_method/ui/widgets/choose_verify_account_button_widget.dart';
import 'package:bulka/modules/authentication/choose_verify_method/ui/widgets/choose_verify_contact_details_image.dart';
import 'package:bulka/modules/authentication/choose_verify_method/ui/widgets/choose_verify_method_widget.dart';
import 'package:bulka/modules/authentication/login/ui/widgets/auth_title_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChooseVerifyMethodScreen extends StatelessWidget {
  const ChooseVerifyMethodScreen(this.params, {super.key});
  final ChooseVerifyMethodParams params;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: CustomAppBarWidget(),
      ),
      body: BlocProvider(
        create: (context) => ChooseVerifyMethodCubit(),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              vSpace(30),
              AuthTitleWidget(
                title: AppStrings.verifyContactDetails.tr(),
                description: AppStrings.pleaseVerifyYourContactInformation.tr(),
                textAlign: TextAlign.center,
                needStartEffect: false,
              ),
              vSpace(20),
              const ChooseVerifyContactDetailsImage(),
              vSpace(20),
              ChooseVerifyMethodWidget(params),
              vSpace(20),
              ChooseVerifyAccountButtonWidget(params),
              // vSpace(20),
            ],
          ),
        ),
      ),
    );
  }
}
