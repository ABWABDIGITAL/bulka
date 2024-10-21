import 'package:bulka/modules/user_language/controller/user_language_cubit.dart';
import 'package:bulka/modules/user_language/view/states/all_languages/all_languages_error_view.dart';
import 'package:bulka/modules/user_language/view/states/all_languages/all_languages_loading_view.dart';
import 'package:bulka/modules/user_language/view/states/all_languages/all_languages_success_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllLanguageListView extends StatelessWidget {
  const AllLanguageListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserLanguageCubit, UserLanguageState>(
        buildWhen: (previous, current) =>
            current is GetAllLanguagesError ||
            current is GetAllLanguagesLoaded ||
            current is GetAllLanguagesLoading,
        builder: (context, state) {
          if (state is GetAllLanguagesLoading) {
            return const AllLanguageLoadingView();
          }
          if (state is GetAllLanguagesLoaded) {
            return AllLanguageSuccessView(userLanguage: state.userLanguage);
          }
          if (state is GetAllLanguagesError) {
            return AllLanguageErrorView(
              error: state.error,
            );
          }
          return const SizedBox();
        });
  }
}
