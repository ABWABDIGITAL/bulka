import 'package:bulka/core/services/servies_locator/service_locator.dart';
import 'package:bulka/core/shared/widgets/appbar_widget.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/modules/user_language/controller/user_language_cubit.dart';
import 'package:bulka/modules/user_language/view/widgets/user_language_add_button.dart';
import 'package:bulka/modules/user_language/view/widgets/user_language_list_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserLanguagesScreen extends StatelessWidget {
  const UserLanguagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OpacityAppbarWidget(
        title: AppStrings.userLanguages.tr(),
      ),
      body: BlocProvider(
        create: (context) => UserLanguageCubit(sl())..getUserLanguage(),
        child: const Padding(
          padding: EdgeInsets.all(24.0),
          child: Column(
            children: [
              Expanded(child: UserLanguageListView()),
              UserLanguageAddButton(),
            ],
          ),
        ),
      ),
    );
  }
}
