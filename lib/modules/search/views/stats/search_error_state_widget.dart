import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/core/utils/widgets/errors/error_full_screen.dart';
import 'package:bulka/core/utils/widgets/errors/error_screen.dart';
import 'package:bulka/modules/search/controller/cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchErrorStateWidget extends StatelessWidget {
  const SearchErrorStateWidget({super.key, required this.error});
  final ApiErrorEntity error;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SearchCubit>();
    return cubit.searchEntity == null
        ? ErrorFullScreen(
            error: error,
            onPressed: () {
              cubit.searchStatesHandled();
            },
          )
        : ErrorScreen(
            error: error,
            onPressed: () {
              cubit.searchStatesHandled();
            },
          );
  }
}
