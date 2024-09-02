import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/core/utils/widgets/errors/error_screen.dart';
import 'package:bulka/modules/home_templet/controllers/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBannersErrorWidget extends StatelessWidget {
  const HomeBannersErrorWidget(this.error, {super.key});
  final ApiErrorEntity error;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: ErrorScreen(
        error: error,
        onPressed: () {
          context.read<HomeCubit>().homeBannersStatesHandled();
        },
      ),
    );
  }
}
