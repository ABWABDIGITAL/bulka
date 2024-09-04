import 'package:bulka/core/shared/widgets/properties_card_widget.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/modules/home/ui/widgets/home_title_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PropertiesForSaleListWidget extends StatelessWidget {
  const PropertiesForSaleListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HomeTitleWidget(
          AppStrings.propertiesForSale.tr(),
          onPressed: () {},
        ),
        SizedBox(
          height: 185.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return PropertiesCardWidget(
                width: 180.w,
                height: 185.h,
                image:
                    'https://s3-alpha-sig.figma.com/img/9cc2/3be7/e02c6b64ddcca7653644881e1ce5cf34?Expires=1726444800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=Wd8zgFly7z4GN8zPhlYsr-xa~LC5v2PtwxzMgChUrQbKMBdx1fqVQ6RzjiBTU8A3y30BqlqhmNEtU4evkQzaOEBb8NpcG-uoaoNq5fs0SidJQS6zpsZno37JbQKIfYVU8Qb64JBcvUfklTC~G3Fus81tfatsgWy4ZiVBCtJMKUaONmuHJELYkaYwZi~JfIaAgJTCgNTKhk9v5Ei6Fg96dEcf3wWRPkmF8B6D1ij95u3gztcYxMdlp8b-oDsq-IzI-boLrMcVZT-Lq8QCtXTbfUd4ZVepWcu~RXAvxf7vFng-zoDiq~V1Ztr-xJz~-oNLfShgTq7yCsY4ST5JB4QjEg__',
                subtitle: '4517 Washington Ave. Manchester, Kentucky 39495',
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
