import 'package:bulka/core/shared/widgets/appbar_widget.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/modules/authentication/choose_registration_type/controllers/choose_registeration_type_cubit.dart';
import 'package:bulka/modules/authentication/choose_registration_type/ui/widgets/choose_registeration_type_button_widget.dart';
import 'package:bulka/modules/authentication/choose_registration_type/ui/widgets/choose_registration_type_row_widget.dart';
import 'package:bulka/modules/authentication/login/ui/widgets/auth_divider_widget.dart';
import 'package:bulka/modules/authentication/login/ui/widgets/auth_title_widget.dart';
import 'package:bulka/modules/authentication/login/ui/widgets/oauth_login_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChooseRegisterationTypeScreen extends StatelessWidget {
  const ChooseRegisterationTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: CustomAppBarWidget(),
      ),
      body: BlocProvider(
        create: (context) => ChooseRegisterationTypeCubit(),
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                vSpace(30),
                AuthTitleWidget(title: AppStrings.registerToUs.tr()),
                vSpace(20),
                const ChooseRegistrationTypeRowWidget(),
                vSpace(70),
                const ChooseRegisterationTypeButtonWidget(),
                vSpace(33),
                const AuthDividerWidget(),
                vSpace(20),
                const OauthLoginWidget(),
                vSpace(20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
