import 'package:bulka/core/services/servies_locator/service_locator.dart';
import 'package:bulka/core/shared/components/pagination_loading.dart';
import 'package:bulka/core/utils/enums/enums.dart';
import 'package:bulka/core/utils/home_utilites.dart';
import 'package:bulka/core/utils/widgets/errors/error_full_screen.dart';
import 'package:bulka/core/utils/widgets/errors/error_screen.dart';
import 'package:bulka/modules/home/ui/widgets/home_appbar_widget.dart';
import 'package:bulka/modules/see_all_ad/controller/see_all_ad_cubit.dart';
import 'package:bulka/modules/see_all_ad/controller/see_all_ad_state.dart';
import 'package:bulka/modules/see_all_ad/data/params/see_all_params.dart';
import 'package:bulka/modules/see_all_ad/views/stats/see_all_ad_error_screen_widget.dart';
import 'package:bulka/modules/see_all_ad/views/stats/see_all_ad_loading_screen_widget.dart';
import 'package:bulka/modules/see_all_ad/views/stats/see_all_ad_success_screen_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeeAllAdScreen extends StatelessWidget {
  const SeeAllAdScreen({
    super.key,
    required this.params,
  });
  final SeeAllParams params;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SeeAllAdCubit(sl())..seeAllAdStatesHandled(params),
      child: Scaffold(
        appBar: const HomeAppbarWidget(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: BlocBuilder<SeeAllAdCubit, SeeAllAdState>(
            buildWhen: (previous, current) =>
                current is SeeAllAdLoading ||
                current is SeeAllAdSuccess ||
                current is SeeAllAdError,
            builder: (context, state) {
              final cubit = context.read<SeeAllAdCubit>();
              if (state is SeeAllAdLoading) {
                if (cubit.seeAllAdEntity == null) {
                  return const SeeAllAdLoadingScreenWidget();
                } else {
                  Column(
                    children: [
                      Expanded(child: SeeAllAdSuccessScreenWidget(params)),
                      const PagginationLoadingWidget(),
                    ],
                  );
                }
              }
              if (state is SeeAllAdError) {
                return SeeAllAdErrorScreenWidget(
                  error: state.error,
                  params: params,
                );
              }

              if (cubit.seeAllAdEntity != null || state is SeeAllAdSuccess) {
                return SeeAllAdSuccessScreenWidget(params);
              }
              return const Text('no state provided');
            },
          ),
        ),
      ),
    );
  }
}
