import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/core/utils/widgets/errors/error_full_screen.dart';
import 'package:bulka/modules/home/controller/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeErrorWidget extends StatelessWidget {
  const HomeErrorWidget(this.error, {super.key});
  final ApiErrorEntity error;
  @override
  Widget build(BuildContext context) {
    return ErrorFullScreen(
      error: error,
      onPressed: () {
        context.read<HomeCubit>().homeStatesHandled();
      },
    );
  }
}
