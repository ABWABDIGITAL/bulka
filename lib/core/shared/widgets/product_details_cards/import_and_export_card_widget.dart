import 'package:bulka/core/shared/components/default_ink_well_widget.dart';
import 'package:bulka/core/shared/widgets/favourite_icon_widget.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/widgets/misc/default_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImportAndExportCardWidget extends StatelessWidget {
  const ImportAndExportCardWidget({
    super.key,
    required this.image,
    required this.title,
    required this.id,
    this.height,
    this.width,
  });
  final String image;
  final String title;
  final String id;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return CustomeInkWellWidget(
      onTap: () {
        // context.push(const JopDetailsScreen());
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
              child: Stack(
            children: [
              const DefaultNetworkImage(
                'https://s3-alpha-sig.figma.com/img/d964/5f8d/a07fb79062dcc8f9d6556f13ad83a65b?Expires=1726444800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=XKi93LRCvQgDekDlQhaj7xCoYueP6sunQHDj6hEBzWnNc0f1t9tWlJDVDuZ1PZK0VPUYdPVUACcovsy6ZW8OmlKCaNCy5tY2aeFhiqHu0rDCtjiRoSFGZDuLJSK6zOdiDfh~Ou8An--aBauCu7ZIfAgyUvrje7iJkxo68jUZLxqiwGpBTWGeZibrCRDZBMlXi6ouTmulU3zWdq~-6U88Le5mMpaREeOIZI6ic4pfwD7vBIxBkeWc3igioSVamF2cRkD5cxtCSqqlrsBinCz32tHx0Ht4zm19idoJ6TstxRJdOJPFgh6hKYiHwYgYx4pkORSvb7C74lYQnuhC8MSp1A__',
              ),
              PositionedDirectional(
                top: 5.r,
                end: 5.r,
                child: CircleAvatar(
                  radius: 18.r,
                  backgroundColor: AppColors.black.withOpacity(.5),
                  child: const FavouriteIconWidget(
                    color: AppColors.white,
                  ),
                ),
              ),
            ],
          )),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.r),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyles.rubik12W400LightPrimary,
                    maxLines: 1,
                  ),
                  Row(
                    children: [
                      Text(
                        '\$ 450',
                        style: TextStyles.rubik14W500Primary,
                      ),
                      Text(
                        '/piece',
                        style: TextStyles.rubik10W400BlueGrey,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'MOQ : ',
                        style: TextStyles.rubik10W700MediumGrey14,
                      ),
                      Text(
                        '1 Piece',
                        style: TextStyles.rubik10W700MediumGrey14.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Sold by :',
                        style: TextStyles.rubik10W700MediumGrey14
                            .copyWith(color: const Color(0xFF525252)),
                      ),
                      Expanded(
                        child: Text(
                          'Appario Retail Pvt Ltd',
                          style: TextStyles.rubik10W700MediumGrey14.copyWith(
                              fontWeight: FontWeight.w400, fontSize: 10.sp),
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
