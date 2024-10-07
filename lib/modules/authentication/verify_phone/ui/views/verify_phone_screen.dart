import 'package:bulka/core/services/servies_locator/service_locator.dart';
import 'package:bulka/core/shared/widgets/appbar_widget.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/modules/authentication/choose_verify_method/data/params/choose_verify_method_params.dart';
import 'package:bulka/modules/authentication/login/ui/widgets/auth_title_widget.dart';
import 'package:bulka/modules/authentication/verify_phone/controllers/verify_phone_cubit.dart';
import 'package:bulka/modules/authentication/verify_phone/ui/widgets/verify_phone_otp_pin_code_field_widget.dart';
import 'package:bulka/modules/authentication/verify_phone/ui/widgets/verify_phone_resend_verification_code_widget.dart';
import 'package:bulka/modules/authentication/verify_phone/ui/widgets/verify_phone_button_widget.dart';
import 'package:bulka/modules/authentication/verify_phone/ui/widgets/verify_phone_image_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyPhoneScreen extends StatelessWidget {
  const VerifyPhoneScreen(this.params, {super.key});
  final ChooseVerifyMethodParams params;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: CustomAppBarWidget(),
      ),
      body: BlocProvider(
        create: (context) => VerifyPhoneCubit(
          verifyPhoneRepo: sl(),
          params: params,
        ),
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                vSpace(30),
                AuthTitleWidget(
                  title: AppStrings.verifyYourPhone.tr(),
                  description:
                      AppStrings.checkYourPhoneAndEnterVerification.tr(),
                  textAlign: TextAlign.center,
                  needStartEffect: false,
                ),
                vSpace(20),
                const VerifyPhoneImageWidget(),
                vSpace(20),
                const VerifyPhoneResendVerificationCodeWidget(),
                vSpace(20),
                const VerifyPhoneOtpPinCodeFieldWidget(),
                vSpace(20),
                const VerifyPhoneButtonWidget(),
                vSpace(20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
