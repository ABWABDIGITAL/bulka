import 'package:bulka/core/services/servies_locator/service_locator.dart';
import 'package:bulka/core/shared/widgets/appbar_widget.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/modules/authentication/company_register/controllers/company_register_cubit.dart';
import 'package:bulka/modules/authentication/company_register/ui/widgets/already_have_account_widget.dart';
import 'package:bulka/modules/authentication/company_register/ui/widgets/company_privacy_and_conditions_widget.dart';
import 'package:bulka/modules/authentication/company_register/ui/widgets/company_register_button_widget.dart';
import 'package:bulka/modules/authentication/company_register/ui/widgets/company_register_fields_widget.dart';
import 'package:bulka/modules/authentication/login/ui/widgets/auth_divider_widget.dart';
import 'package:bulka/modules/authentication/login/ui/widgets/auth_title_widget.dart';
import 'package:bulka/modules/authentication/login/ui/widgets/oauth_login_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompanyRegisterScreen extends StatelessWidget {
  const CompanyRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: CustomAppBarWidget(),
      ),
      body: BlocProvider(
        create: (context) => CompanyRegisterCubit(sl()),
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                vSpace(30),
                AuthTitleWidget(title: AppStrings.registerToUs.tr()),
                const CompanyRegisterFieldsWidget(),
                vSpace(20),
                const CompanyPrivacyAndConditionsWidget(),
                vSpace(20),
                const CompanyRegisterButtonWidget(),
                vSpace(20),
                const AuthDividerWidget(),
                vSpace(20),
                const OauthLoginWidget(),
                vSpace(20),
                const AlreadyHaveAccountWidget(),
                vSpace(40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
