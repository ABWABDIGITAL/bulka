import 'package:bulka/core/services/servies_locator/service_locator.dart';
import 'package:bulka/core/shared/abstractions/account_verification.dart';
import 'package:bulka/core/shared/widgets/appbar_widget.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/modules/login/ui/widgets/auth_title_widget.dart';
import 'package:bulka/modules/verify_account/controllers/verify_account_cubit.dart';
import 'package:bulka/modules/verify_account/ui/widgets/otp_pin_code_field_widget.dart';
import 'package:bulka/modules/verify_account/ui/widgets/resend_verification_code_widget.dart';
import 'package:bulka/modules/verify_account/ui/widgets/verify_account_button_widget.dart';
import 'package:bulka/modules/verify_account/ui/widgets/verify_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyAccountScreen extends StatelessWidget {
  const VerifyAccountScreen({
    super.key,
    required this.accountVerification,
  });
  final AccountVerification accountVerification;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: CustomeAppBarWidget(),
      ),
      body: BlocProvider(
        create: (context) => VerifyAccountCubit(sl()),
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                vSpace(30),
                AuthTitleWidget(
                  title: accountVerification.title,
                  description: accountVerification.description,
                  textAlign: TextAlign.center,
                  needStartEffect: false,
                ),
                vSpace(20),
                VerifyImageWidget(
                  accountVerification: accountVerification,
                ),
                vSpace(20),
                const ResendVerificationCodeWidget(),
                vSpace(20),
                const OtpPinCodeFieldWidget(),
                vSpace(20),
                const VerifyAccountButtonWidget(),
                vSpace(20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
