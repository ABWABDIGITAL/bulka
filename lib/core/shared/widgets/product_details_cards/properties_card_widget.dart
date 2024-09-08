import 'dart:io';
import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/shared/components/default_ink_well_widget.dart';
import 'package:bulka/core/shared/widgets/favourite_icon_widget.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/extensions/extensions.dart';
import 'package:bulka/core/utils/widgets/misc/default_network_image.dart';
import 'package:bulka/modules/properity_product_details/ui/views/properity_product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PropertiesCardWidget extends StatelessWidget {
  const PropertiesCardWidget({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.id,
    this.height,
    this.width,
  });
  final String image;
  final String title;
  final String subtitle;
  final String id;
  final double? height;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return CustomeInkWellWidget(
      onTap: () {
        context.push(const ProperityProductDetailsScreen());
      },
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: AppColors.softGrey2, width: 1),
          color: AppColors.white,
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        child: Column(children: [
          Expanded(
            child: Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              margin: const EdgeInsets.all(2),
              child: DefaultNetworkImage(image),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.r),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: TextStyles.rubik12W400LightPrimary,
                          maxLines: 1,
                        ),
                      ),
                      const FavouriteIconWidget(),
                    ],
                  ),
                  Text(
                    subtitle,
                    style: TextStyles.rubik10W400Black100,
                    maxLines: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      propretiesRow(
                        icon: AssetIcons.bedSvg,
                        text: '2',
                      ),
                      propretiesRow(
                        icon: AssetIcons.shawerSvg,
                        text: '2',
                      ),
                      propretiesRow(
                        icon: AssetIcons.carSvg,
                        text: '3',
                      ),
                      propretiesRow(
                        icon: AssetIcons.shawerSvg,
                        text: '1200sqt',
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }

  Widget propretiesRow({
    required String icon,
    required String text,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SvgPicture.asset(
          icon,
          height: 11.h,
          width: 11.w,
        ),
        hSpace(4),
        Text(
          text,
          style: TextStyles.rubik10W400Black100,
        ),
      ],
    );
  }
}
