import 'package:bulka/core/services/servies_locator/service_locator.dart';
import 'package:bulka/core/shared/widgets/appbar_widget.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/modules/offers/controllers/offers_cubit.dart';
import 'package:bulka/modules/offers/view/widgets/offers/all_offers_list_view.dart';
import 'package:bulka/modules/offers/view/widgets/offers/offers_banner_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OffersScreen extends StatefulWidget {
  const OffersScreen({super.key});

  @override
  State<OffersScreen> createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
  int activeImageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OpacityAppbarWidget(title: AppStrings.offers.tr()),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: BlocProvider(
          create: (context) => OffersCubit(sl())
            ..getOffers()
            ..getOffersBanner(),
          child: Column(
            children: [
              const OffersBannerWidget(),
              vSpace(20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.forYou.tr(),
                    style: TextStyles.rubik14W500Black,
                  ),
                  const AllOffersListView(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
