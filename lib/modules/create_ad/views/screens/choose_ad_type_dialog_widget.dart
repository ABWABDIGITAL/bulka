import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/enums/enums.dart';
import 'package:bulka/core/utils/extensions/extensions.dart';
import 'package:bulka/core/utils/widgets/buttons/default_button.dart';
import 'package:bulka/core/utils/widgets/dialogs/app_bottom_sheet.dart';
import 'package:bulka/modules/create_ad/views/screens/choose_ad_price_type_dialog_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

List<String> adTypesListOptions = [
  AppStrings.posts.tr(),
  AppStrings.car.tr(),
  AppStrings.properties.tr(),
  AppStrings.importAndExport.tr(),
  AppStrings.createJob.tr(),
];
void chooseAdTypeDialogWidget(BuildContext context) {
  String groupValue = adTypesListOptions[0];
  return AppBottomSheet.open(
    context: context,
    isScrollControlled: true,
    child: StatefulBuilder(builder: (context, setState) {
      setState(() {});
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.selectYourConditions.tr(),
                style: TextStyles.rubik15W500Black,
              ),
              IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: const Icon(Icons.close, color: AppColors.darkGrey),
              )
            ],
          ),
          const Divider(),
          Column(
            children: List.generate(
              adTypesListOptions.length,
              (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      groupValue = adTypesListOptions[index];
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.transparent,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColors.grey),
                    ),
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      decoration: groupValue == adTypesListOptions[index]
                          ? BoxDecoration(
                              color: AppColors.opactiyPrimary,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: AppColors.primary),
                            )
                          : null,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Radio<String>.adaptive(
                            value: adTypesListOptions[index],
                            groupValue: groupValue,
                            onChanged: (value) {},
                            activeColor: AppColors.primary,
                          ),
                          Text(
                            adTypesListOptions[index].tr(),
                            style: TextStyles.rubik15W500Black,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          DefaultButton(
            text: AppStrings.Continue.tr(),
            onPressed: () {
              context.pop();

              if (groupValue == adTypesListOptions[0]) {
                chooseAdPriceTypeDialogWidget(
                  context: context,
                  adType: AdType.posts,
                );
              }
              if (groupValue == adTypesListOptions[1]) {
                chooseAdPriceTypeDialogWidget(
                  context: context,
                  adType: AdType.cars,
                );
              }
              if (groupValue == adTypesListOptions[2]) {
                chooseAdPriceTypeDialogWidget(
                  context: context,
                  adType: AdType.properties,
                );
              }
              if (groupValue == adTypesListOptions[3]) {
                chooseAdPriceTypeDialogWidget(
                  context: context,
                  adType: AdType.import_export,
                );
              }
              if (groupValue == adTypesListOptions[4]) {
                chooseAdPriceTypeDialogWidget(
                  context: context,
                  adType: AdType.jobs,
                );
              }
            },
          )
        ],
      );
    }),
  );
}
