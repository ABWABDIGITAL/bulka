import 'package:bulka/core/shared/shimmer/shimmer_container_widget.dart';
import 'package:bulka/core/shared/shimmer/shimmer_text_widget.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/widgets/misc/default_network_image.dart';
import 'package:bulka/modules/choose_interests/data/entity/interests_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InterestsContainerWidget extends StatelessWidget {
  const InterestsContainerWidget({
    super.key,
    required this.interests,
    this.isSelected = false,
    this.onTap,
    this.isLoading = false,
  });
  final InterestsEntity interests;
  final bool isSelected;
  final void Function()? onTap;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? () {} : onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: isSelected ? AppColors.green : AppColors.mediumGrey6,
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ShimmerContainerWidget(
                  isLoading: isLoading,
                  height: 50.h,
                  width: 50.w,
                  child: DefaultNetworkImage(
                    interests.image,
                    fit: BoxFit.contain,
                    height: 50.h,
                    width: 50.w,
                  ),
                ),
                vSpace(16),
                ShimmerTextWidget(
                  interests.name,
                  style: TextStyles.rubik14W500MediumGrey7,
                  isLoading: isLoading,
                ),
              ],
            ),
            PositionedDirectional(
              top: 10.h,
              end: 10.w,
              child: ShimmerContainerWidget(
                isLoading: isLoading,
                height: 20.h,
                width: 20.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isSelected ? AppColors.green : AppColors.white,
                  border: Border.all(
                    color: isSelected ? AppColors.green : AppColors.mediumGrey6,
                  ),
                ),
                child: isSelected
                    ? const Icon(
                        CupertinoIcons.checkmark,
                        color: AppColors.white,
                        size: 14,
                      )
                    : null,
              ),
            )
          ],
        ),
      ),
    );
  }
}
