import 'package:bulka/core/shared/widgets/product_details_cards/import_and_export_card_widget.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImportAndExportScreen extends StatelessWidget {
  const ImportAndExportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.products.tr(),
            style: TextStyles.rubik16W500Black2,
          ),
          Expanded(
            child: GridView.builder(
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 14.r,
                  mainAxisSpacing: 12.r,
                  mainAxisExtent: 200,
                ),
                itemBuilder: (context, index) {
                  return const ImportAndExportCardWidget(
                    id: '0',
                    image: '',
                    title: 'Banama 450 Kg Forklift',
                  );
                }),
          )
        ],
      ),
    );
  }
}
