import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/extensions/extensions.dart';
import 'package:bulka/core/utils/widgets/dialogs/dialogs.dart';
import 'package:bulka/core/utils/widgets/loading/adaptive_circuler.dart';
import 'package:bulka/modules/user_language/controller/user_language_cubit.dart';
import 'package:bulka/modules/user_language/data/entities/user_language_entity.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserLanguageListTile extends StatelessWidget {
  final UserLanguageEntity userLanguage;
  const UserLanguageListTile({
    super.key,
    required this.userLanguage,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UserLanguageCubit>();
    return BlocConsumer<UserLanguageCubit, UserLanguageState>(
      listenWhen: (previous, current) =>
          current is DeleteUserLanguageLoading ||
          current is DeleteUserLanguageLoaded ||
          current is DeleteUserLanguageError,
      listener: (context, state) {
        if (state is DeleteUserLanguageError) {
          Dialogs.errorDialog(context: context, error: state.error);
        }
        if (state is DeleteUserLanguageLoaded) {
         // context.pop();
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(state.message),
              actions: [
                TextButton(
                  onPressed: () {
                    cubit.getUserLanguage();
                    context.pop();
                  },
                  child: Text(AppStrings.ok.tr()),
                ),
              ],
            ),
          );
        }
      },
      buildWhen: (previous, current) =>
          current is DeleteUserLanguageLoading ||
          current is DeleteUserLanguageLoaded ||
          current is DeleteUserLanguageError,
      builder: (context, state) {
        return ListTile(
            onTap: () {
              cubit.selectedDeleteLangId = userLanguage.id;
              cubit.deleteUserLang();
            },
            contentPadding: EdgeInsets.zero,
            title:
                Text(userLanguage.language, style: TextStyles.rubik14W500Black),
            trailing: (state is DeleteUserLanguageLoading)
                ? AdaptiveCircularProgress()
                : const Icon(
                    Icons.delete_rounded,
                    color: AppColors.red,
                  ),
            leading: CircleAvatar(
              backgroundImage: NetworkImage(userLanguage.flag),
              radius: 30.r,
            ),
            subtitle: Text(userLanguage.level));
      },
    );
  }
}
