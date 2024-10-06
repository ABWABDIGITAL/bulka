import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/core/utils/widgets/errors/error_screen.dart';
import 'package:bulka/modules/choose_interests/controllers/choose_interests_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InterestsErrorWidget extends StatelessWidget {
  const InterestsErrorWidget(this.error, {super.key});
  final ApiErrorEntity error;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: ErrorScreen(
        error: error,
        onPressed: () {
          context.read<ChooseInterestsCubit>().chooseInterestsStatesHandled();
        },
      ),
    );
  }
}
