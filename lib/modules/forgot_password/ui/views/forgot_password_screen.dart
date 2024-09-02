import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/assets/asset_images.dart';
import 'package:bulka/core/services/servies_locator/service_locator.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/constant/strings.dart';
import 'package:bulka/modules/forgot_password/controllers/forgot_password_cubit.dart';
import 'package:bulka/modules/forgot_password/ui/widgets/choose_forgot_password_method_widget.dart';
import 'package:bulka/modules/forgot_password/ui/widgets/forgot_password_appbar_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Image.asset(
                        AssetIcons.secretLock,
                        height: 180.h,
                        width: 180.w,
                      ),
                      Image.asset(
                        AssetImages.stars,
                        fit: BoxFit.contain,
                        height: 220.h,
                      )
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Card(
                margin: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusDirectional.only(
                    topStart: Radius.circular(25.r),
                    topEnd: Radius.circular(25.r),
                  ),
                ),
                color: AppColors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    vSpace(25),
                    Text(
                      AppStrings.forgotPassword.tr(),
                      style: TextStyles.rubik17W500Black,
                    ),
                    vSpace(6),
                    const ChooseForgotPasswordMethodWidget(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
