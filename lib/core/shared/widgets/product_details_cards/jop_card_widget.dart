import 'package:bulka/core/shared/components/default_ink_well_widget.dart';
import 'package:bulka/core/shared/entity/product_entities/product_main_information_entity.dart';
import 'package:bulka/core/shared/shimmer/shimmer_container_widget.dart';
import 'package:bulka/core/shared/shimmer/shimmer_text_widget.dart';
import 'package:bulka/core/shared/widgets/favourite_icon_widget.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/home_utilites.dart';
import 'package:bulka/core/utils/widgets/misc/default_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class JopCardWidget extends StatelessWidget {
  const JopCardWidget({
    super.key,
    this.height,
    this.width,
    required this.info,
    this.isLoading = false,
  });

  final double? height;
  final double? width;
  final bool isLoading;
  final ProductMainInformationEntity info;
  @override
  Widget build(BuildContext context) {
    return CustomeInkWellWidget(
      onTap: () {
        goToSuitableProductDetails(mainInfo: info, context: context);
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
                    'location',
                    style: TextStyles.rubik6W400Black100,
                    isLoading: isLoading,
                  ),
                  ShimmerTextWidget(
                    'createdAt',
                    style: TextStyles.rubik6W400Black100,
                    isLoading: isLoading,
                  )
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
