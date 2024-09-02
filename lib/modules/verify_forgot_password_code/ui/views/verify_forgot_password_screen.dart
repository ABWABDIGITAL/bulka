import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/services/servies_locator/service_locator.dart';
import 'package:bulka/core/shared/abstractions/account_forgot_password.dart';
import 'package:bulka/core/shared/widgets/build_forgot_password_return_method_circle_widget.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/constant/strings.dart';
import 'package:bulka/core/utils/widgets/buttons/default_button.dart';
import 'package:bulka/modules/forgot_password/controllers/forgot_password_cubit.dart';
import 'package:bulka/modules/forgot_password/ui/widgets/forgot_password_appbar_widget.dart';
import 'package:bulka/modules/forgot_password/ui/widgets/forgot_password_background_widget.dart';
import 'package:bulka/modules/forgot_password/ui/widgets/forgot_password_card_widget.dart';
import 'package:bulka/modules/verify_forgot_password_code/controllers/verify_forgot_password_cubit.dart';
import 'package:bulka/modules/verify_forgot_password_code/ui/widgets/verify_forgot_password_button_widget.dart';
import 'package:bulka/modules/verify_forgot_password_code/ui/widgets/verify_forgot_password_fields_widget.dart';
import 'package:bulka/modules/verify_forgot_password_code/ui/widgets/verify_forgot_password_resend_timer_wiget.dart';
import 'package:bulka/modules/verify_forgot_password_code/ui/widgets/verify_forgot_password_title_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyForgotPasswordScreen extends StatelessWidget {
  const VerifyForgotPasswordScreen({
    super.key,
    required this.accountForgotPassword,
  });
  final AccountForgotPassword accountForgotPassword;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VerifyForgotPasswordCubit(sl()),
      child: Scaffold(
        backgroundColor: const Color(0xFFF6F8FF),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(appbarheight),
          child: const ForgotPasswordAppbarWidget(),
        ),
        body: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            const ForgotPasswordImageBackgroundWidget(
              imagePath: AssetIcons.secretLock,
            ),
            ForgotPasswordCardWidget(
              height: MediaQuery.sizeOf(context).height / 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  VerifyForgotPasswordTitleWidget(
                    accountForgotPassword: accountForgotPassword,
                  ),
                  const VerifyForgotPasswordFieldsWidget(),
                  const VerifyForgotPasswordResendTimerWiget(),
                  VerifyForgotPasswordButtonWidget(
                    accountForgotPassword: accountForgotPassword,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
