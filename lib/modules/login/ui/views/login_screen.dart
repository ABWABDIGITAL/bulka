import 'package:bulka/core/services/servies_locator/service_locator.dart';
import 'package:bulka/core/shared/widgets/appbar_widget.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/modules/login/controllers/login_cubit.dart';
import 'package:bulka/modules/login/ui/widgets/auth_divider_widget.dart';
import 'package:bulka/modules/login/ui/widgets/dont_have_account_widget.dart';
import 'package:bulka/modules/login/ui/widgets/form_fields_widget.dart';
import 'package:bulka/modules/login/ui/widgets/login_button_widget.dart';
import 'package:bulka/modules/login/ui/widgets/auth_title_widget.dart';
import 'package:bulka/modules/login/ui/widgets/oauth_login_widget.dart';
import 'package:bulka/modules/login/ui/widgets/remember_me_and_forget_password_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: CustomeAppBarWidget(),
      ),
      body: BlocProvider(
        create: (context) => LoginCubit(sl()),
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                vSpace(30),
                const AuthTitleWidget(),
                const LoginFormFieldsWidget(),
                vSpace(20),
                const RememberMeAndForgetPasswordWidget(),
                vSpace(20),
                const LoginButtonWidget(),
                vSpace(33),
                const AuthDividerWidget(),
                vSpace(20),
                const OauthLoginWidget(),
                vSpace(20),
                const DontHaveAccountWidget(),
                vSpace(40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
