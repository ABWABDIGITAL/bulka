import 'dart:io';
import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/shared/components/default_ink_well_widget.dart';
import 'package:bulka/core/shared/entity/product_entities/product_main_information_entity.dart';
import 'package:bulka/core/shared/shimmer/shimmer_container_widget.dart';
import 'package:bulka/core/shared/shimmer/shimmer_text_widget.dart';
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
    required this.info,
    this.height,
    this.width,
    this.isLoading = true,
  });

  final double? height;
  final double? width;
  final bool isLoading;
  final ProductMainInformationEntity info;
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
              child: isLoading
                  ? const ShimmerContainerWidget()
                  : DefaultNetworkImage(info.image),
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
                        child: ShimmerTextWidget(
                          info.name,
                          style: TextStyles.rubik12W400LightPrimary,
                          maxLines: 1,
                          isLoading: isLoading,
                        ),
                      ),
                      if (!isLoading) const FavouriteIconWidget(),
                    ],
                  ),
                  ShimmerTextWidget(
                    info.description,
                    style: TextStyles.rubik10W400Black100,
                    maxLines: 2,
                    isLoading: isLoading,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      propretiesRow(
                        icon: AssetIcons.bedSvg,
                        text: '2',
                        isLoading: isLoading,
                      ),
                      propretiesRow(
                        icon: AssetIcons.shawerSvg,
                        text: '2',
                        isLoading: isLoading,
                      ),
                      propretiesRow(
                        icon: AssetIcons.carSvg,
                        text: '3',
                        isLoading: isLoading,
                      ),
                      propretiesRow(
                        icon: AssetIcons.shawerSvg,
                        text: '1200sqt',
                        isLoading: isLoading,
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
    required bool isLoading,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        if (!isLoading)
          SvgPicture.asset(
            icon,
            height: 11.h,
            width: 11.w,
          ),
        if (isLoading)
          ShimmerContainerWidget(
            height: 11.h,
            width: 11.w,
            borderRadiusValue: 500,
          ),
        hSpace(4),
        ShimmerTextWidget(
          text,
          style: TextStyles.rubik10W400Black100,
          isLoading: isLoading,
        ),
      ],
    );
  }
}
