import 'package:bulka/core/assets/asset_images.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/extensions/extensions.dart';
import 'package:bulka/modules/offers/data/entities/offers_entity.dart';
import 'package:bulka/modules/offers/view/screens/offer_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllOffersSuccessView extends StatelessWidget {
  final List<OffersEntity> offers;
  const AllOffersSuccessView({
    super.key, required this.offers,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      separatorBuilder: (context, index) => vSpace(20),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount:offers.length,
      itemBuilder: (context, index) {
        return InkWell(
          borderRadius: BorderRadius.circular(16.0),
          onTap: () {
            context.push( OfferDetailsScreen(offer: offers[index],));
          },
          child: Container(
            height: 104.h,
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              image: const DecorationImage(
                  image: AssetImage(AssetImages.offersSmallCardBackground),
                  fit: BoxFit.fill),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    vSpace(10),
                    Text( offers[index].title, style: TextStyles.rubik19W600White),
                    vSpace(10),
                    Text( offers[index].description, style: TextStyles.rubik13W500White),
                  ],
                ),
                Image.network(offers[index].image, width: 72.w, height: 72.h),
              ],
            ),
          ),
        );
      },
    );
  }
}
