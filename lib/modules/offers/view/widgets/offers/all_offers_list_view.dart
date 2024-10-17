import 'package:bulka/modules/offers/controllers/offers_cubit.dart';
import 'package:bulka/modules/offers/view/states/all_offers/all_offers_error_view.dart';
import 'package:bulka/modules/offers/view/states/all_offers/all_offers_loading_view.dart';
import 'package:bulka/modules/offers/view/states/all_offers/all_offers_success_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllOffersListView extends StatelessWidget {
  const AllOffersListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OffersCubit, OffersState>(
        buildWhen: (previous, current) =>
            current is OffersError ||
            current is OffersLoaded ||
            current is OffersLoading,
        builder: (context, state) {
          if (state is OffersLoading) {
            return const AllOffersLoadingView();
          }
          if (state is OffersLoaded) {
            return AllOffersSuccessView(offers: state.offers);
          }
          if (state is OffersError) {
            return AllOffersErrorView(
              error: state.error,
            );
          }
          return const AllOffersLoadingView();
        });
  }
}
