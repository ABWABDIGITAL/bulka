import 'package:bulka/modules/faq/controllers/faq_cubit.dart';
import 'package:bulka/modules/faq/ui/states/faq/faq_error_view.dart';
import 'package:bulka/modules/faq/ui/states/faq/faq_loading_view.dart';
import 'package:bulka/modules/faq/ui/states/faq/faq_success_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FaqListView extends StatelessWidget {
  const FaqListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FaqCubit, FaqState>(
        buildWhen: (previous, current) =>
            current is FaqError ||
            current is FaqLoaded ||
            current is FaqLoading,
        builder: (context, state) {
          if (state is FaqLoading) {
            return const FaqLoadingView();
          }
          if (state is FaqLoaded) {
            return FaqSuccessView(
              faqItems: state.faqs,
            );
          }
          if (state is FaqError) {
            return FaqErrorView(
              error: state.error,
            );
          }
          return const FaqLoadingView();
        });
  }
}
