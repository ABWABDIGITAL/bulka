import 'package:bulka/core/services/ad_details/controller/cubit/ad_details_cubit.dart';
import 'package:bulka/core/services/ad_details/data/params/ad_details_params.dart';
import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/core/utils/widgets/errors/error_full_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarProductDetailsErrorStateWidget extends StatelessWidget {
  const CarProductDetailsErrorStateWidget({
    super.key,
    required this.error,
    required this.params,
  });

  final AdDetailsParams params;
  final ApiErrorEntity error;

  @override
  Widget build(BuildContext context) {
    return ErrorFullScreen(
      error: error,
      onPressed: () {
        context.read<AdDetailsCubit>().adDetailsStatesHandled(params);
      },
    );
  }
}
