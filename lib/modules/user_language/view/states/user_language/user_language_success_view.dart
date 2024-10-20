import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/modules/user_language/data/entities/user_language_entity.dart';
import 'package:bulka/modules/user_language/view/widgets/user_language_list_tile.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class UserLanguageSuccessView extends StatelessWidget {
  final List<UserLanguageEntity> userLanguage;
  const UserLanguageSuccessView({
    super.key,
    required this.userLanguage,
  });

  @override
  Widget build(BuildContext context) {
    return userLanguage.isEmpty
        ?  Center(
            child: Text(AppStrings.nolanguagesAddedYet.tr()),
          )
        : ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) => UserLanguageListTile(
                  userLanguage: userLanguage[index],
                ),
            separatorBuilder: (context, index) => vSpace(8),
            itemCount: userLanguage.length);
  }
}
