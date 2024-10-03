import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/assets/asset_images.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProperityProductDetailsMainInfoWidget extends StatelessWidget {
  const ProperityProductDetailsMainInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'RUB 26.000.000',
                style: TextStyles.rubik14W600Primary,
              ),
              vSpace(10),
              Row(
                children: [
                  SvgPicture.asset(AssetIcons.rateSvg),
                  Text(
                    '4.8',
                    style: TextStyles.rubik16W400Black,
                  ),
                  Text(
                    '(18 reviews)',
                    style: TextStyles.rubik16W400MediumGrey10,
                  )
                ],
              ),
              vSpace(10),
              Row(
                children: [
                  SvgPicture.asset(AssetIcons.locationSvg),
                  Text(
                    'Balakovo, Russia',
                    style: TextStyles.rubik16W400Black,
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: Image.asset(
            AssetImages.map,
            height: 140.h,
          ),
        ),
      ],
    );
  }
}
