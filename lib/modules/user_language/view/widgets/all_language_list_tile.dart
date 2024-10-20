import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/modules/user_language/controller/user_language_cubit.dart';
import 'package:bulka/modules/user_language/data/entities/user_language_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllLanguagesListTile extends StatelessWidget {
  final UserLanguageEntity lang;
  const AllLanguagesListTile({super.key, required this.lang});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UserLanguageCubit>();
    return BlocBuilder<UserLanguageCubit, UserLanguageState>(
      buildWhen: (previous, current) => current is SelectedLanguage,
      builder: (context, state) {
        return Container(
          /*  decoration: BoxDecoration(
            color: _selectedLanguage?.displayedName == lang.displayedName
                ? const Color.fromARGB(255, 170, 239, 202)
                : Colors.white,
          ), */
          child: RadioListTile(
            
            selectedTileColor: const Color.fromARGB(255, 170, 239, 202),
            controlAffinity: ListTileControlAffinity.leading,
            title: Row(
              children: [
                Expanded(
                  child: Text(
                    lang.language,
                    style: TextStyles.rubik14W400Black2,
                  ),
                ),
                Image.network(
                  lang.flag,
                  height: 50,
                  width: 50,
                ),
              ],
            ),
            value: lang,
            groupValue: cubit.selectedLanguage,
            activeColor: const Color(0xFF00AF54),
            onChanged: (newValue) {
              cubit.setSelectedLanguage(newValue);
            },
          ),
        );
      },
    );
  }
}
