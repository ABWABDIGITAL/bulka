import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/services/servies_locator/service_locator.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/constant/strings.dart';
import 'package:bulka/modules/authentication/forgot_password/controllers/forgot_password_cubit.dart';
import 'package:bulka/modules/authentication/forgot_password/ui/widgets/choose_forgot_password_method_widget.dart';
import 'package:bulka/modules/authentication/forgot_password/ui/widgets/forgot_password_appbar_widget.dart';
import 'package:bulka/modules/authentication/forgot_password/ui/widgets/forgot_password_background_widget.dart';
import 'package:bulka/modules/authentication/forgot_password/ui/widgets/forgot_password_button_widget.dart';
import 'package:bulka/modules/authentication/forgot_password/ui/widgets/forgot_password_card_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgotPasswordCubit(sl()),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    AppStrings.forgotPassword.tr(),
                    style: TextStyles.rubik17W500Black,
                  ),
                  const ChooseForgotPasswordMethodWidget(),
                  const ForgotPasswordButtonWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
