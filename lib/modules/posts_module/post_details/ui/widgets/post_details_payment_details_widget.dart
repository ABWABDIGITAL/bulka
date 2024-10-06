import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostDetailsPaymentDetailsWidget extends StatelessWidget {
  const PostDetailsPaymentDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          vSpace(20),
          Text(
            AppStrings.paymentDetails.tr(),
            style: TextStyles.rubik16W500Black3,
          ),
          vSpace(20),
          Row(
            children: [
              Expanded(
                child: Text(
                  AppStrings.totalProductPrice.tr(),
                  style: TextStyles.rubik14W400DarkGrey5,
                ),
              ),
              Expanded(
                child: Text(
                  '10,000 \$',
                  style: TextStyles.rubik14W400DarkGrey5,
                  textAlign: TextAlign.end,
                ),
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  AppStrings.realFees.tr(),
                  style: TextStyles.rubik14W400DarkGrey5,
                ),
              ),
              Expanded(
                child: Text(
                  '50 \$',
                  style: TextStyles.rubik14W400DarkGrey5,
                  textAlign: TextAlign.end,
                ),
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  AppStrings.taxes.tr(),
                  style: TextStyles.rubik14W400DarkGrey5,
                ),
              ),
              Expanded(
                child: Text(
                  '50 \$',
                  style: TextStyles.rubik14W400DarkGrey5,
                  textAlign: TextAlign.end,
                ),
              )
            ],
          ),
          Divider(
            color: AppColors.grey,
            endIndent: 100.w,
            indent: 100.w,
            thickness: .7,
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  AppStrings.totalAmount.tr(),
                  style: TextStyles.rubik14W400DarkGrey5,
                ),
              ),
              Expanded(
                child: Text(
                  '12,505 \$',
                  style: TextStyles.rubik14W400DarkGrey5,
                  textAlign: TextAlign.end,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
