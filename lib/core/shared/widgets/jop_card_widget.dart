import 'package:bulka/core/shared/components/default_ink_well_widget.dart';
import 'package:bulka/core/shared/widgets/favourite_icon_widget.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/widgets/misc/default_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class JopCardWidget extends StatelessWidget {
  const JopCardWidget({
    super.key,
    required this.image,
    required this.title,
    required this.id,
    this.height,
    this.width,
    this.location,
    this.createdAt,
  });
  final String image;
  final String title;
  final String id;
  final double? height;
  final double? width;
  final String? location;
  final String? createdAt;
  @override
  Widget build(BuildContext context) {
    return CustomeInkWellWidget(
      onTap: () {},
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
                  if (location != null)
                    Text(
                      location ?? "",
                      style: TextStyles.rubik6W400Black100,
                    ),
                  if (createdAt != null)
                    Text(
                      createdAt ?? "",
                      style: TextStyles.rubik6W400Black100,
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
