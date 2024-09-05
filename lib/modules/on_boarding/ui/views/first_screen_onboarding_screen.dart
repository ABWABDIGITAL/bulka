import 'package:bulka/core/assets/asset_images.dart';
import 'package:bulka/core/services/cache/shared_pref.dart';
import 'package:bulka/core/shared/widgets/appbar_widget.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/constant/shared_pref_keys.dart';
import 'package:bulka/core/utils/constant/strings.dart';
import 'package:bulka/core/utils/extensions/extensions.dart';
import 'package:bulka/core/utils/widgets/buttons/default_button.dart';
import 'package:bulka/modules/authentication/login/ui/views/login_screen.dart';
import 'package:bulka/modules/choose_interests/ui/views/choose_interests_screen.dart';
import 'package:bulka/modules/home/ui/views/home_screen.dart';
import 'package:bulka/modules/on_boarding/ui/widgets/onboarding_clip_bottom_widget.dart';
import 'package:bulka/modules/on_boarding/ui/widgets/onboarding_content_widget.dart';
import 'package:bulka/modules/posts_module/posts/ui/views/posts_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart' as smooth;

class FirstScreenOnboardingScreen extends StatefulWidget {
  const FirstScreenOnboardingScreen({super.key});

  @override
  State<FirstScreenOnboardingScreen> createState() =>
      _FirstScreenOnboardingScreenState();
}

class _FirstScreenOnboardingScreenState
    extends State<FirstScreenOnboardingScreen> {
  final PageController page = PageController();
  int _currentPage = 0;

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: CustomeAppBarWidget(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarBrightness: Brightness.light,
            statusBarColor: AppColors.white,
            statusBarIconBrightness: Brightness.dark,
          ),
        ),
      ),
      body: Column(
        children: [
          vSpace(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              smooth.SmoothPageIndicator(
                controller: page,
                count: 3,
                axisDirection: Axis.vertical,
                effect: const smooth.SlideEffect(
                  spacing: 12,
                  radius: 12.0,
                  dotWidth: 12.0,
                  dotHeight: 12.0,
                  type: smooth.SlideType.slideUnder,
                  paintStyle: PaintingStyle.stroke,
                  strokeWidth: 0,
                  dotColor: Colors.grey,
                  activeDotColor: AppColors.primary,
                ),
              )
            ],
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.r),
              child: PageView(
                controller: page,
                onPageChanged: _onPageChanged,
                children: [
                  OnboardingContentWidget(
                    data: OnboardingContentData(
                      imagePath: AssetImages.firstOnboarding,
                      title: AppStrings.welcomeToBalka.tr(),
                      subtitle: AppStrings
                          .connectsSellersAndBuyesForSeamlessTradingExperience
                          .tr(),
                    ),
                  ).animate(delay: 1500.ms).fadeIn(),
                  OnboardingContentWidget(
                    data: OnboardingContentData(
                      imagePath: AssetImages.secondtOnboarding,
                      title: AppStrings.discoverExcitingOpportunities.tr(),
                      subtitle: AppStrings
                          .exploreListingFromTrustedSellersDiscover
                          .tr(),
                    ),
                  ),
                  OnboardingContentWidget(
                    data: OnboardingContentData(
                      imagePath: AssetImages.thirdOnboarding,
                      title: AppStrings.safeAndSecureTransactions.tr(),
                      subtitle: AppStrings
                          .ourTustedPaymentGatewaysProtectionMechnisms
                          .tr(),
                    ),
                  )
                ],
              ),
            ),
          ),
          vSpace(20),
          OnboardingClipBottomWidget(
            onTap: () async {
              if (_currentPage == 2) {
                await SharedPrefHelper.setData(
                  SharedPrefKeys.isShownOboarding,
                  true,
                ).then(
                  (_) {
                    // context.push(const LoginScreen());
                    // context.push(const ChooseInterestsScreen());
                    // context.push(const PostsScreen());
                    context.push(const HomeScreen());
                  },
                );
              } else {
                page.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.ease,
                );
              }
            },
          )
        ],
      ),
    );
  }
}
