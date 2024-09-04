import 'package:bulka/core/shared/widgets/car_card_widget.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/modules/home/ui/widgets/home_title_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarForSaleListWidget extends StatelessWidget {
  const CarForSaleListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HomeTitleWidget(
          AppStrings.carsForSale.tr(),
          onPressed: () {},
        ),
        SizedBox(
          height: 185.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return CarCardWidget(
                width: 180.w,
                height: 185.h,
                image:
                    'https://s3-alpha-sig.figma.com/img/d964/5f8d/a07fb79062dcc8f9d6556f13ad83a65b?Expires=1726444800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=XKi93LRCvQgDekDlQhaj7xCoYueP6sunQHDj6hEBzWnNc0f1t9tWlJDVDuZ1PZK0VPUYdPVUACcovsy6ZW8OmlKCaNCy5tY2aeFhiqHu0rDCtjiRoSFGZDuLJSK6zOdiDfh~Ou8An--aBauCu7ZIfAgyUvrje7iJkxo68jUZLxqiwGpBTWGeZibrCRDZBMlXi6ouTmulU3zWdq~-6U88Le5mMpaREeOIZI6ic4pfwD7vBIxBkeWc3igioSVamF2cRkD5cxtCSqqlrsBinCz32tHx0Ht4zm19idoJ6TstxRJdOJPFgh6hKYiHwYgYx4pkORSvb7C74lYQnuhC8MSp1A__',
                subtitle: 'Marcedes-Benz G63 AMG',
                model: 'New - 2023',
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
