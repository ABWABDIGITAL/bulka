import 'package:bulka/core/services/ad_details/controller/cubit/ad_details_cubit.dart';
import 'package:bulka/core/services/ad_details/controller/cubit/ad_details_state.dart';
import 'package:bulka/core/services/ad_details/data/params/ad_details_params.dart';
import 'package:bulka/core/services/servies_locator/service_locator.dart';
import 'package:bulka/modules/ad_details_modules/car_product_details/ui/stats/car_product_details_error_state_widget.dart';
import 'package:bulka/modules/ad_details_modules/car_product_details/ui/stats/car_product_details_loading_state_widget.dart';
import 'package:bulka/modules/ad_details_modules/car_product_details/ui/stats/car_product_details_success_state_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarProductDetailsScreen extends StatelessWidget {
  const CarProductDetailsScreen({
    super.key,
    required this.params,
  });
  final AdDetailsParams params;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AdDetailsCubit(sl())
        ..adDetailsStatesHandled(AdDetailsParams(id: params.id)),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        body: BlocBuilder<AdDetailsCubit, AdDetailsState>(
          buildWhen: (previous, current) =>
              current is AdDetailsLoading ||
              current is AdDetailsSuccess ||
              current is AdDetailsError,
          builder: (context, state) {
            final cubit = context.read<AdDetailsCubit>();
            if (state is AdDetailsLoading) {
              return const CarProductDetailsLoadingStateWidget();
            }
            if (state is AdDetailsError) {
              return CarProductDetailsErrorStateWidget(
                  error: state.error, params: params);
            }
            if (cubit.adDetails != null || state is AdDetailsSuccess) {
              return const CarProductDetailsSuccessStateWidget();
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
