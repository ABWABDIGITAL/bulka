import 'package:bulka/core/shared/widgets/appbar_widget.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/modules/authentication/login/ui/widgets/auth_title_widget.dart';
import 'package:bulka/modules/contact_info/controllers/contact_info_cubit.dart';
import 'package:bulka/modules/contact_info/ui/widgets/contact_info_pin_code_form_field.dart';
import 'package:bulka/modules/contact_info/ui/widgets/contact_info_verify_image.dart';
import 'package:bulka/modules/contact_info/ui/widgets/contact_info_verify_save_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactInfoVerifyScreen extends StatelessWidget {
  
  final ContactInfoCubit cubit;

  const ContactInfoVerifyScreen({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: CustomAppBarWidget(),
      ),
      body: BlocProvider.value(
        value: cubit,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              vSpace(30),
              AuthTitleWidget(
                title: AppStrings.verify.tr(),
                //   description: AppStrings.checkYourPhoneAndEnterVerification.tr(),
                textAlign: TextAlign.center,
                needStartEffect: false,
              ),
              vSpace(20),
              const ContactInfoVerifyImage(),
              vSpace(20),
              const ContactInfoPinCodeField(),
              vSpace(20),
              const ContactInfoVerifyButton(),
              vSpace(20),
            ],
          ),
        ),
      ),
    );
  }
}
