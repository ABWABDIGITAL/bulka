import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/widgets/buttons/default_button.dart';
import 'package:bulka/core/utils/widgets/dialogs/dialogs.dart';
import 'package:bulka/modules/user_language/controller/user_language_cubit.dart';
import 'package:bulka/modules/user_language/view/screens/user_language_all_levels.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllLanguagesAddLevelButton extends StatelessWidget {
  const AllLanguagesAddLevelButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<UserLanguageCubit>();
    return BlocConsumer<UserLanguageCubit, UserLanguageState>(
      listenWhen: (previous, current) =>
          current is GetAllLevelsLoading ||
          current is GetAllLevelsLoaded ||
          current is GetAllLevelsError,
      listener: (context, state) {
        if (state is GetAllLevelsError) {
          Dialogs.errorDialog(context: context, error: state.error);
        }
        if (state is GetAllLevelsLoaded) {
          showLevelDialog(context);
        }
      },
      buildWhen: (previous, current) =>
          current is GetAllLevelsLoading ||
          current is GetAllLevelsLoaded ||
          current is GetAllLevelsError,
      builder: (context, state) {
        return DefaultButton(
          onPressed: () {
            if (cubit.selectedLanguage == null) {
              showDialog(
                context: context,
                builder: (BuildContext _) {
                  return AlertDialog(
                    title: Text(AppStrings.pleaseSelectLangFirst.tr()),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text('OK'.tr()),
                      ),
                    ],
                  );
                },
              );
              return;
            } else {
              cubit.getAllLevels();
            }
          },
          isLoading: state is GetAllLevelsLoading ? true : false,
          text: AppStrings.addLevel.tr(),

          //  isLoading: state is LoginStateLoading ? true : false,
        );
      },
    );
  }
}
