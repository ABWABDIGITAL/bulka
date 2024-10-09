import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CarProductDetailsMainInfoWidget extends StatelessWidget {
  const CarProductDetailsMainInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.r),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Sedan S 500',
                  style: TextStyles.rubik20W700Black,
                ),
              ),
              Text(
                '50\$',
                style: TextStyles.mulish16W700Primary,
              ),
            ],
          ),
          vSpace(12),
          Row(
            children: [
              SvgPicture.asset(
                AssetIcons.rateSvg,
                height: 16.h,
                width: 16.r,
              ),
              hSpace(6),
              Text(
                '4.9',
                style: TextStyles.mulish14W400Black,
              ),
              hSpace(6),
              Text(
                '(230 Reviews)',
                style: TextStyles.mulish12W400Black,
              ),
            ],
          ),
          vSpace(12),
          GridView.builder(
            itemCount: 4,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(vertical: 0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 25.h,
              mainAxisSpacing: 6.r,
            ),
            itemBuilder: (context, index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    AssetIcons.fuelSvg,
                    height: 16.h,
                    width: 16.r,
                  ),
                  hSpace(16),
                  Text(
                    '5 Seats',
                    style: TextStyles.mulish14W400Black,
                  )
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
