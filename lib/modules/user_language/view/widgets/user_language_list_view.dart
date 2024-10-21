import 'package:bulka/modules/user_language/controller/user_language_cubit.dart';
import 'package:bulka/modules/user_language/view/states/user_language/user_language_error_view.dart';
import 'package:bulka/modules/user_language/view/states/user_language/user_language_loading_view.dart';
import 'package:bulka/modules/user_language/view/states/user_language/user_language_success_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserLanguageListView extends StatelessWidget {
  const UserLanguageListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserLanguageCubit, UserLanguageState>(
        buildWhen: (previous, current) =>
            current is GetUserLanguageError ||
            current is GetUserLanguageLoaded ||
            current is GetUserLanguageLoading,
        builder: (context, state) {
          if (state is GetUserLanguageLoading) {
            return const UserLanguageLoadingView();
          }
          if (state is GetUserLanguageLoaded) {
            return UserLanguageSuccessView(userLanguage: state.userLanguage);
          }
          if (state is GetUserLanguageError) {
            return UserLanguageErrorView(
              error: state.error,
            );
          }
          return const UserLanguageLoadingView();
        });
  }
}
