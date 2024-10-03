import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ProfileOrdersTapsWidget extends StatelessWidget {
  const ProfileOrdersTapsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final orderTaps = [
      OrderTapsEntity(
        svgPath: AssetIcons.boxTickCompeleted,
        count: 12,
        text: AppStrings.completed.tr(),
      ),
      OrderTapsEntity(
        svgPath: AssetIcons.boxTickActive,
        count: 44,
        text: AppStrings.active.tr(),
      ),
      OrderTapsEntity(
        svgPath: AssetIcons.boxTickPending,
        count: 120,
        text: AppStrings.pending.tr(),
      ),
      OrderTapsEntity(
        svgPath: AssetIcons.boxTickPending,
        imageColor: AppColors.red,
        count: 120,
        text: AppStrings.cancelled.tr(),
      ),
    ];
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Divider(
            thickness: 3.h,
            color: AppColors.opactiyPrimary,
          ),
        ),
        Column(
          children: [
            SizedBox(
              height: 110.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsetsDirectional.only(start: 16.r),
                itemBuilder: (context, index) {
                  return Container(
                    width: 95.w,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.grey),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 11.r),
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          orderTaps[index].svgPath,
                          height: 22.h,
                          width: 22.w,
                        ),
                        vSpace(12),
                        Text(
                          '(${orderTaps[index].count})',
                          style: TextStyles.rubik11W400MediumGrey10,
                        ),
                        vSpace(12),
                        Text(
                          orderTaps[index].text,
                          style: TextStyles.rubik14W500Black
                              .copyWith(fontSize: 12.sp),
                        ),
                      ],
                    ),
                  ).animate().fade(delay: (index * 750).ms);
                },
                separatorBuilder: (context, index) => hSpace(16),
                itemCount: orderTaps.length,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Divider(
            thickness: 3.h,
            color: AppColors.opactiyPrimary,
          ),
        ),
      ],
    );
  }
}

class OrderTapsEntity extends Equatable {
  const OrderTapsEntity({
    required this.svgPath,
    this.imageColor,
    required this.count,
    required this.text,
  });
  final String svgPath;
  final Color? imageColor;
  final num count;
  final String text;

  @override
  List<Object?> get props => [svgPath, count, text, imageColor];
}
