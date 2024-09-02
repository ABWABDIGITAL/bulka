import 'package:bulka/modules/home_templet/controllers/home_cubit.dart';
import 'package:bulka/modules/home_templet/controllers/home_state.dart';
import 'package:bulka/modules/home_templet/ui/stats/banners/home_banners_error_widget.dart';
import 'package:bulka/modules/home_templet/ui/stats/banners/home_banners_loading_widget.dart';
import 'package:bulka/modules/home_templet/ui/stats/banners/home_banners_success_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBannersWidget extends StatelessWidget {
  const HomeBannersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is GetHomeBannersLoadingState ||
          current is GetHomeBannersSuccessState ||
          current is GetHomeBannersErrorState,
      builder: (context, state) {
        if (state is GetHomeBannersLoadingState) {
          return const HomeBannersLoadingWidget();
        }
        if (state is GetHomeBannersSuccessState) {
          return HomeBannersSuccessWidget(state.banners);
        }
        if (state is GetHomeBannersErrorState) {
          return HomeBannersErrorWidget(state.error);
        }
        return const SliverToBoxAdapter(child: Text('no state loaded'));
      },
    );
  }
}
