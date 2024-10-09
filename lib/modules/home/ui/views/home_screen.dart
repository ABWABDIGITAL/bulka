import 'package:bulka/core/services/servies_locator/service_locator.dart';
import 'package:bulka/modules/home/controller/cubit/home_cubit.dart';
import 'package:bulka/modules/home/controller/cubit/home_state.dart';
import 'package:bulka/modules/home/ui/stats/home_error_widget.dart';
import 'package:bulka/modules/home/ui/stats/home_loading_widget.dart';
import 'package:bulka/modules/home/ui/stats/home_success_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(sl())..homeStatesHandled(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.r),
        child: BlocBuilder<HomeCubit, HomeState>(
          buildWhen: (previous, current) =>
              current is GetHomeLoading ||
              current is GetHomeSuccess ||
              current is GetHomeError,
          builder: (context, state) {
            final cubit = context.read<HomeCubit>();

            if (state is GetHomeLoading) {
              return const HomeLoadingWidget();
            }
            if (cubit.homeEntity != null || state is GetHomeSuccess) {
              return const HomeSuccessWidget();
            }
            if (state is GetHomeError) {
              return HomeErrorWidget(state.error);
            }
            return const Text('no state provided');
          },
        ),
      ),
    );
  }
}
