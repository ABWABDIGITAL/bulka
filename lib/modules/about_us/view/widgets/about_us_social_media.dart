import 'package:bulka/modules/about_us/controller/about_us_cubit.dart';
import 'package:bulka/modules/about_us/view/states/about_us_error_view.dart';
import 'package:bulka/modules/about_us/view/states/about_us_loading_view.dart';
import 'package:bulka/modules/about_us/view/states/about_us_success_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AboutUsSocialMedia extends StatelessWidget {
  const AboutUsSocialMedia({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AboutUsCubit, AboutUsState>(
        buildWhen: (previous, current) =>
            current is AboutUsError ||
            current is AboutUsLoaded ||
            current is AboutUsLoading,
        builder: (context, state) {
          if (state is AboutUsLoading) {
            return const AboutUsLoadingView();
          }
          if (state is AboutUsLoaded) {
            return AboutUsSuccessView(
              aboutUsEntity: state.aboutUsEntity,
            );
          }
          if (state is AboutUsError) {
            return AboutUsErrorView(
              error: state.error,
            );
          }
          return const AboutUsLoadingView();
        });
  }
}
