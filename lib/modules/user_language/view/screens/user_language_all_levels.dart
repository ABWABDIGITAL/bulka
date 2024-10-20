import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/extensions/extensions.dart';
import 'package:bulka/core/utils/widgets/buttons/default_button.dart';
import 'package:bulka/core/utils/widgets/dialogs/dialogs.dart';
import 'package:bulka/modules/user_language/controller/user_language_cubit.dart';
import 'package:bulka/modules/user_language/data/entities/all_levels_entity.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Default selected level

void showLevelDialog(BuildContext context) {
  showDialog(
    context: context,
    
    builder: (BuildContext _) {
      return BlocProvider.value(
        value: context.read<UserLanguageCubit>(),
        child: AlertDialog(
          contentPadding: const EdgeInsets.all(24),
          
         
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          content: BlocBuilder<UserLanguageCubit, UserLanguageState>(
            buildWhen: (previous, current) =>
                current is GetAllLevelsLoading ||
                current is GetAllLevelsLoaded ||
                current is GetAllLevelsError ||
                current is SelectedLevel,
            builder: (context, state) {
              final cubit = context.read<UserLanguageCubit>();
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListView.separated(
                    separatorBuilder: (context, index) => vSpace(8),
                    itemCount: cubit.allLevels!.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return RadioListTile<AllLevelsEntity>(
                        title: Text(cubit.allLevels![index].level),
                        value: cubit.allLevels![index],
                        groupValue: cubit.selectedLevel,
                        onChanged: (value) {
                          cubit.setSelectedLevel(value);
                        },
                      );
                    },
                  ),
                  vSpace(16),
                  PostUserLanguageButton(cubit: cubit)
                ],
              );
            },
          ),
        ),
      );
    },
  );
}

class PostUserLanguageButton extends StatelessWidget {
  const PostUserLanguageButton({
    super.key,
    required this.cubit,
  });

  final UserLanguageCubit cubit;

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<UserLanguageCubit>();
    return BlocConsumer<UserLanguageCubit, UserLanguageState>(
      listenWhen: (previous, current) =>
          current is PostUserNewLanguageLoading ||
          current is PostUserNewLanguageLoaded ||
          current is PostUserNewLanguageError,
      listener: (context, state) {
        if (state is PostUserNewLanguageError) {
          Dialogs.errorDialog(context: context, error: state.error);
        }
        if (state is PostUserNewLanguageLoaded) {
          context.pop();
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(state.message),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(AppStrings.ok.tr()),
                ),
              ],
            ),
          );
        }
      },
      buildWhen: (previous, current) =>
          current is PostUserNewLanguageLoading ||
          current is PostUserNewLanguageLoaded ||
          current is PostUserNewLanguageError,
      builder: (context, state) {
        return DefaultButton(
          onPressed: () {
            cubit.postUserNewLang();
          },
          isLoading: state is PostUserNewLanguageLoading ? true : false,
          text: AppStrings.save.tr(),

          //  isLoading: state is LoginStateLoading ? true : false,
        );
      },
    );
  }
}
