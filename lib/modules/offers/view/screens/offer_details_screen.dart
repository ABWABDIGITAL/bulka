import 'package:bulka/core/shared/widgets/appbar_widget.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/modules/offers/data/entities/offers_entity.dart';
import 'package:bulka/modules/offers/view/widgets/offer_banner_card.dart';
import 'package:bulka/modules/offers/view/widgets/offer_details/completed_offers_number.dart';
import 'package:bulka/modules/offers/view/widgets/offer_details/offer_details_button.dart';
import 'package:bulka/modules/offers/view/widgets/offer_details/offer_details_description.dart';
import 'package:bulka/modules/offers/view/widgets/offer_details/offer_details_title.dart';
import 'package:bulka/modules/offers/view/widgets/offer_details/offer_start_and_end_date.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class OfferDetailsScreen extends StatelessWidget {
  final OffersEntity offer;
  const OfferDetailsScreen({super.key, required this.offer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OpacityAppbarWidget(title: AppStrings.offerDetails.tr()),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OfferBannerCard(
              image: offer.image,
            ),
            vSpace(24),
            const OfferDetailsTitle(),
            vSpace(16),
             OfferStartAndEndDate(
              startDate: offer.startDate,
              endDate: offer.endDate,
            ),
            const SizedBox(height: 20),
             OfferDetailsDescription(description: offer.description,),
            const Spacer(),
            const CompletedOffersNumber(),
            vSpace(20),
            const OfferDetailsButton(),
          ],
        ),
      ),
    );
  }
}
