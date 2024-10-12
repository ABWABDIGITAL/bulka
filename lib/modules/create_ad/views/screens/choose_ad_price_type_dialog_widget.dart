import 'package:bulka/core/services/servies_locator/service_locator.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/enums/enums.dart';
import 'package:bulka/core/utils/extensions/extensions.dart';
import 'package:bulka/core/utils/widgets/buttons/default_button.dart';
import 'package:bulka/core/utils/widgets/dialogs/app_bottom_sheet.dart';
import 'package:bulka/modules/create_ad/controller/cubit/create_ad_cubit.dart';
import 'package:bulka/modules/create_ad/controller/cubit/create_ad_state.dart';
import 'package:bulka/modules/create_ad/views/screens/create_ad_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<PricingTypes> pricingTypes = [];
void chooseAdPriceTypeDialogWidget({
  required BuildContext context,
  required AdType adType,
}) {
  PricingTypes? groupValue;
  pricingTypes.clear();
  return AppBottomSheet.open(
    context: context,
    isScrollControlled: true,
    child: BlocProvider(
      create: (context) => CreateAdCubit(sl())..buyingAdStatesHandled(),
      child: BlocConsumer<CreateAdCubit, CreateAdState>(
        listenWhen: (previous, current) =>
            current is BuyingAdLoading ||
            current is BuyingAdSuccess ||
            current is BuyingAdError,
        listener: (context, state) {
          if (state is BuyingAdSuccess) {
            pricingTypes.addAll([
              PricingTypes(
                title: AppStrings.standard.tr(),
                subTitle: '2 ${'ads for free/ month'.tr()}',
                adLift: state.buyingAdEntity.freeAd != 0
                    ? '${state.buyingAdEntity.freeAd} ${'Left'.tr()}'
                    : '${state.buyingAdEntity.priceOfStandardAd}/${AppStrings.ad.tr()}',
              ),
              PricingTypes(
                title: AppStrings.promoted.tr(),
                subTitle: 'Use promoted ads to reach more customers'.tr(),
                adLift: state.buyingAdEntity.reminedNumberOfPromotionAd != 0
                    ? '${state.buyingAdEntity.reminedNumberOfPromotionAd} ${'Left'.tr()}'
                    : '${state.buyingAdEntity.priceOfPromotionAd}/${AppStrings.ad.tr()}',
              ),
            ]);
          }
        },
        buildWhen: (previous, current) =>
            current is BuyingAdLoading ||
            current is BuyingAdSuccess ||
            current is BuyingAdError,
        builder: (context, state) {
          if (state is BuyingAdLoading) {
            return const Column(
              children: [
                Center(child: CircularProgressIndicator()),
              ],
            );
          }
          if (state is BuyingAdSuccess) {
            return StatefulBuilder(builder: (context, setState) {
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
                        icon:
                            const Icon(Icons.close, color: AppColors.darkGrey),
                      )
                    ],
                  ),
                  const Divider(),
                  vSpace(5),
                  Column(
                    children: List.generate(
                      pricingTypes.length,
                      (index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              groupValue = pricingTypes[index];
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
                              decoration: groupValue == pricingTypes[index]
                                  ? BoxDecoration(
                                      color: AppColors.opactiyPrimary,
                                      borderRadius: BorderRadius.circular(10),
                                      border:
                                          Border.all(color: AppColors.primary),
                                    )
                                  : null,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Radio<PricingTypes>.adaptive(
                                    value: pricingTypes[index],
                                    groupValue: groupValue,
                                    onChanged: (value) {},
                                    activeColor: AppColors.primary,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          pricingTypes[index].title,
                                          style: TextStyles.rubik15W500Black,
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                pricingTypes[index].subTitle,
                                                style: TextStyles
                                                    .rubik13W400IconGrey,
                                              ),
                                            ),
                                            Text(
                                              pricingTypes[index].adLift,
                                              style: TextStyles
                                                  .rubik13W400IconGrey,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
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
                    elevation: groupValue == null ? 0 : 1,
                    backgroundColor:
                        groupValue == null ? AppColors.grey : AppColors.primary,
                    onPressed: () {
                      if (groupValue == null) return;
                      context.pop();
                      context.push(
                        CreateAdScreen(
                          adType: adType,
                          isPromoted:
                              groupValue?.title == AppStrings.promoted.tr()
                                  ? true
                                  : false,
                        ),
                      );
                    },
                  )
                ],
              );
            });
          }
          if (state is BuyingAdError) {
            return const SizedBox();
            // return ErrorScreen(
            //   error: state.error,
            //   onPressed: () {
            //     cubit.buyingAdStatesHandled();
            //   },
            // );
          }
          return const SizedBox();
        },
      ),
    ),
  );
}

class PricingTypes extends Equatable {
  final String title;
  final String subTitle;
  final String adLift;

  const PricingTypes({
    required this.title,
    required this.subTitle,
    required this.adLift,
  });
  @override
  List<Object?> get props => [title, subTitle, adLift];
}
