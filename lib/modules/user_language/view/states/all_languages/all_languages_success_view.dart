import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/modules/user_language/controller/user_language_cubit.dart';
import 'package:bulka/modules/user_language/data/entities/user_language_entity.dart';
import 'package:bulka/modules/user_language/view/widgets/all_language_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllLanguageSuccessView extends StatelessWidget {
  final List<UserLanguageEntity> userLanguage;
  const AllLanguageSuccessView({
    super.key,
    required this.userLanguage,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UserLanguageCubit>();
    return BlocBuilder<UserLanguageCubit, UserLanguageState>(
      buildWhen: (previous, current) => current is AddSearchList,
      builder: (context, state) {
        return cubit.searchController.text.isEmpty
            ? const SizedBox()
            : ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) => AllLanguagesListTile(
                      lang: userLanguage[index],
                    ),
                separatorBuilder: (context, index) => vSpace(8),
                itemCount: userLanguage.length);
      },
    );
  }
}
