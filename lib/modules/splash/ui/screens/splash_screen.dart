import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/shared/widgets/appbar_widget.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_env.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/extensions/extensions.dart';
import 'package:bulka/modules/on_boarding/ui/views/first_screen_onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: CustomAppBarWidget(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: AppColors.primary,
            statusBarIconBrightness: Brightness.light,
            systemStatusBarContrastEnforced: true,
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        color: AppColors.primary,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AssetIcons.appTransparentIconX4,
              height: 112.h,
              width: 160.w,
              fit: BoxFit.contain,
            ).animate().moveY(begin: -250, duration: 300.ms),
            vSpace(20),
            Text(
              AppEnv.projectName.toUpperCase(),
              style: TextStyles.rubik20W500White,
            ).animate(
              onComplete: (controller) {
                context.pushReplacement(const FirstScreenOnboardingScreen());
                // context.push(const CreateAdScreen());
              },
            ).moveY(begin: 250, duration: 300.ms)
          ],
        ),
      ),
    );
  }
}
