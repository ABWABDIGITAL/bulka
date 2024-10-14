import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/shared/shimmer/shimmer_circuler_icon_widget.dart';
import 'package:bulka/core/shared/shimmer/shimmer_container_widget.dart';
import 'package:bulka/core/shared/shimmer/shimmer_text_widget.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';

class GetPostsLoadingStateWidget extends StatelessWidget {
  const GetPostsLoadingStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Column(
          children: [
            ListTile(
              leading: const CircleAvatar(child: ShimmerCirculerIconWidget()),
              title: ShimmerTextWidget(
                'Mercedes Store',
                style: TextStyles.roboto12W500Black2,
                isLoading: true,
              ),
              subtitle: ShimmerTextWidget(
                'Just Now',
                style: TextStyles.roboto10W500MediumGrey2,
                isLoading: true,
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Shimmer(
                    gradient: const LinearGradient(
                      colors: [
                        AppColors.mediumGrey8,
                        AppColors.mediumGrey8,
                      ],
                    ),
                    child: SvgPicture.asset(
                      AssetIcons.threeDotsSvg,
                      height: 6.h,
                      width: 18.w,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: ShimmerTextWidget(
                          'Mercedes AMG G63',
                          style: TextStyles.roboto14W600Black2,
                          isLoading: true,
                        ),
                      ),
                      ShimmerTextWidget(
                        '3,000,000 EGP',
                        style: TextStyles.roboto14W600Black2,
                        isLoading: true,
                      )
                    ],
                  ),
                  vSpace(16),
                  ShimmerTextWidget(
                    "Inside the wagon AMG, ..........",
                    style: TextStyles.roboto12W400IconGrey,
                    textAlign: TextAlign.start,
                    isLoading: true,
                  ),
                  vSpace(16),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        ShimmerContainerWidget(
                          height: 268.h,
                          width: MediaQuery.sizeOf(context).width,
                        ),
                        Positioned(
                          bottom: 10.r, // Adjust the position as needed
                          child: Container(
                            width: MediaQuery.sizeOf(context).width,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(
                                      0.7), // Adjust opacity for shadow intensity
                                  offset: const Offset(
                                      0, 5), // Vertical offset of shadow
                                  blurRadius: 8, // Blur radius of shadow
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                varientItem(
                                  path: AssetIcons.speedoMeter2Svg,
                                  text: '5k-10k',
                                ),
                                varientItem(
                                  path: AssetIcons.calenderSvg,
                                  text: '2023',
                                ),
                                varientItem(
                                  path: AssetIcons.unlockSvg,
                                  text: 'Used',
                                ),
                                varientItem(
                                  path: AssetIcons.unlockSvg,
                                  text: 'Fabrika',
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  vSpace(16),
                  Row(
                    children: [
                      Shimmer(
                        gradient: const LinearGradient(
                          colors: [
                            AppColors.mediumGrey8,
                            AppColors.mediumGrey8,
                          ],
                        ),
                        child: Container(
                          height: 40.h,
                          width: 40.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.grey),
                            borderRadius: BorderRadius.circular(10.r),
                            color: AppColors.mediumGrey8,
                          ),
                          child: SvgPicture.asset(
                            AssetIcons.heartSvg,
                            height: 20.h,
                            width: 20.w,
                          ),
                        ),
                      ),
                      hSpace(8),
                      Expanded(
                        child: Container(
                          height: 40.h,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.grey),
                            borderRadius: BorderRadius.circular(10.r),
                            color: AppColors.mediumGrey8,
                          ),
                          child: Row(
                            children: [
                              hSpace(10),
                              CircleAvatar(
                                radius: 12.r,
                                child: const ShimmerCirculerIconWidget(),
                              ),
                              hSpace(10),
                              Expanded(
                                child: ShimmerTextWidget(
                                  AppStrings.commentHere.tr(),
                                  style: TextStyles.roboto12W400IconGrey,
                                  isLoading: true,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      hSpace(8),
                      Shimmer(
                        gradient: const LinearGradient(
                          colors: [
                            AppColors.mediumGrey8,
                            AppColors.mediumGrey8,
                          ],
                        ),
                        child: Container(
                          height: 40.h,
                          width: 40.w,
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.grey),
                            borderRadius: BorderRadius.circular(10.r),
                            color: AppColors.mediumGrey8,
                          ),
                          child: SvgPicture.asset(
                            AssetIcons.bookMarkSvg,
                            height: 20.h,
                            width: 20.w,
                          ),
                        ),
                      ),
                      hSpace(8),
                      Shimmer(
                        gradient: const LinearGradient(
                          colors: [
                            AppColors.mediumGrey8,
                            AppColors.mediumGrey8,
                          ],
                        ),
                        child: Container(
                          height: 40.h,
                          width: 40.w,
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.grey),
                            borderRadius: BorderRadius.circular(10.r),
                            color: AppColors.mediumGrey8,
                          ),
                          child: SvgPicture.asset(
                            AssetIcons.shareSvg,
                            height: 20.h,
                            width: 20.w,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        );
      },
      itemCount: 10,
    );
  }

  Widget varientItem({
    required final String path,
    required final String text,
  }) {
    return Row(
      children: [
        Shimmer(
          gradient: const LinearGradient(
            colors: [
              AppColors.mediumGrey8,
              AppColors.mediumGrey8,
            ],
          ),
          child: SvgPicture.asset(
            path,
            height: 18.h,
            width: 18.w,
            color: AppColors.white,
          ),
        ),
        hSpace(7),
        ShimmerTextWidget(
          text,
          style: TextStyles.roboto12W500SoftGrey3,
          isLoading: true,
        )
      ],
    );
  }
}
