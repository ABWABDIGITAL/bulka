import 'package:bulka/core/shared/widgets/appbar_widget.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/modules/user_language/controller/user_language_cubit.dart';
import 'package:bulka/modules/user_language/view/widgets/all_language_list_view.dart';
import 'package:bulka/modules/user_language/view/widgets/all_languages_add_level_button.dart';
import 'package:bulka/modules/user_language/view/widgets/custom_user_language_search_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserLanguageAllLanguagesScreen extends StatelessWidget {
  final UserLanguageCubit cubit;
  const UserLanguageAllLanguagesScreen({
    super.key,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OpacityAppbarWidget(
        title: AppStrings.allLanguages.tr(),
      ),
      body: BlocProvider.value(
        value: cubit..getAllLanguages(),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const CustomUerLanguageSearchBar(),
              vSpace(16),
              const Expanded(child: AllLanguageListView()),
              const AllLanguagesAddLevelButton()
            ],
          ),
        ),
      ),
    );
  }
}
