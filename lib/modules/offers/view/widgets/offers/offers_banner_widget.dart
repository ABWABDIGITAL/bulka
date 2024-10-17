import 'package:bulka/modules/offers/controllers/offers_cubit.dart';
import 'package:bulka/modules/offers/view/states/offer_banner/offer_banner_error_view.dart';
import 'package:bulka/modules/offers/view/states/offer_banner/offer_banner_loading_view.dart';
import 'package:bulka/modules/offers/view/states/offer_banner/offer_banner_success_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OffersBannerWidget extends StatelessWidget {
  const OffersBannerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OffersCubit, OffersState>(
        buildWhen: (previous, current) =>
            current is OffersBannerError ||
            current is OffersBannerLoaded ||
            current is OffersBannerLoading,
        builder: (context, state) {
          if (state is OffersBannerLoading) {
            return const OffersBannerLoadingView();
          }
          if (state is OffersBannerLoaded) {
            return OffersBannerSuccessView(offersBanner: state.offersBanner);
          }
          if (state is OffersBannerError) {
            return OffersBannerErrorView(
              error: state.error,
            );
          }
          return const OffersBannerLoadingView();
        });
  }
}
