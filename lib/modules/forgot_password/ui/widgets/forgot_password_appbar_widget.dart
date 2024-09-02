import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/shared/widgets/appbar_widget.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordAppbarWidget extends StatelessWidget {
  const ForgotPasswordAppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomeAppBarWidget(
      backgroundColor: const Color(0xFFF6F8FF),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Color(0xFFF6F8FF),
        statusBarIconBrightness: Brightness.dark,
        systemStatusBarContrastEnforced: true,
      ),
      iconTheme: const IconThemeData(color: AppColors.iconGrey),
      titleWidget: Row(
        children: [
          Expanded(
            child: Transform.translate(
              offset: const Offset(-15, 0),
              child: Text(
                AppStrings.resetPassword.tr(),
                style: TextStyles.rubik14W500Black,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Image.asset(
            AssetIcons.appGreyIconX4,
            height: 24.h,
            width: 24.w,
          ),
        ],
      ),
    );
  }
}
