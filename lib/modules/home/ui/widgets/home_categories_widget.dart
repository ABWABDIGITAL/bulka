import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/widgets/misc/default_network_image.dart';
import 'package:bulka/modules/home/ui/widgets/home_title_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeCategoriesWidget extends StatelessWidget {
  const HomeCategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        vSpace(20),
        HomeTitleWidget(AppStrings.exploreCategories.tr()),
        vSpace(20),
        SizedBox(
          height: 110.h,
          child: ListView.separated(
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {},
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Card(
                      color: AppColors.opactiyPrimary,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r)),
                      child: Padding(
                        padding: EdgeInsets.all(12.r),
                        child: DefaultNetworkImage(
                          'https://s3-alpha-sig.figma.com/img/1e00/4ee7/892bc0dcea1860f3d5342360776257b6?Expires=1726444800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=ncZyOGMFDQDssDtvoRUy4EdEtUhTlvrnd7qnEiJbYsR~sHAaPosuisQ6sIRFexKFYTbf0AHsl2rRG19P17FhbqL7H~zVSQetCjplLpmxF5aH5hZMq1yJYOfFZWHcrcmwF9Y~42OWBwOt0pZSMsdyK2Yr1-8fRrDAUp6qngES0IA~o9XVJTwr3OGQCn4DUbOiGsD-9~JqJeM9G57QPXqF~9SIc5nPNWlm4IBFBHi~87KiOF-a0QtXaJWn5TIQHTqoRnTv8GektZpjk8cuDanEe1Zgmw1pOVFEsnTLPx0156OD3iHSJRugrnfFW1A5W-sk5y43QPujqqCSQGT1SfJABA__',
                          height: 38.h,
                          width: 38.w,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Properties',
                        style: TextStyles.rubik10W400BlueGrey,
                        maxLines: 2,
                      ),
                    )
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) {
              return hSpace(30);
            },
            itemCount: 10,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ],
    );
  }
}
