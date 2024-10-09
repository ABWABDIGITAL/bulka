import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/core/utils/widgets/errors/error_full_screen.dart';
import 'package:bulka/core/utils/widgets/errors/error_screen.dart';
import 'package:bulka/modules/see_all_ad/controller/see_all_ad_cubit.dart';
import 'package:bulka/modules/see_all_ad/data/params/see_all_params.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeeAllAdErrorScreenWidget extends StatelessWidget {
  const SeeAllAdErrorScreenWidget({
    super.key,
    required this.error,
    required this.params,
  });
  final ApiErrorEntity error;
  final SeeAllParams params;
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SeeAllAdCubit>();

    return cubit.seeAllAdEntity == null
        ? ErrorFullScreen(
            error: error,
            onPressed: () {
              context.read<SeeAllAdCubit>().seeAllAdStatesHandled(params);
            },
          )
        : ErrorScreen(
            error: error,
            onPressed: () {
              context.read<SeeAllAdCubit>().seeAllAdStatesHandled(params);
            },
          );
  }
}
