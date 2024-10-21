import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/extensions/extensions.dart';
import 'package:bulka/core/utils/widgets/buttons/default_button.dart';
import 'package:bulka/modules/user_language/controller/user_language_cubit.dart';
import 'package:bulka/modules/user_language/view/screens/user_language_all_languages_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserLanguageAddButton extends StatelessWidget {
  const UserLanguageAddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultButton(
      onPressed: () {
        context.push(
          UserLanguageAllLanguagesScreen(
            cubit: context.read<UserLanguageCubit>(),
          ),
        );
      },
      text: AppStrings.addLanguage.tr(),
    );
  }
}
