import 'package:bulka/core/shared/widgets/product_details_cards/jop_card_widget.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/modules/home/ui/widgets/home_title_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeJopsSectionWidget extends StatelessWidget {
  const HomeJopsSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HomeTitleWidget(
          AppStrings.jops.tr(),
          onPressed: () {},
        ),
        SizedBox(
          height: 185.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return JopCardWidget(
                width: 180.w,
                height: 185.h,
                image:
                    'https://img.freepik.com/premium-photo/modern-blue-office-chair-set-against-minimalist-background-ai-photo_1192063-14253.jpg?w=1060',
                location: 'Balakovo - Russia',
                createdAt: '5 days ago',
                title: 'RUB 26.000.000',
                id: 'id',
              );
            },
            itemCount: 10,
          ),
        ),
      ],
    );
  }
}
