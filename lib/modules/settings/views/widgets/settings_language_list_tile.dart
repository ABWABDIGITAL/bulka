import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/constant/strings.dart';
import 'package:bulka/core/utils/extensions/extensions.dart';
import 'package:bulka/modules/languages/ui/views/choose_languages_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SettingsLanguageListTile extends StatelessWidget {
  const SettingsLanguageListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      //   contentPadding: const EdgeInsets.symmetric(horizontal: 0),
      leading: SvgPicture.asset(AssetIcons.language2),
      title:
          Text(AppStrings.languages.tr(), style: TextStyles.rubik13W400Black),

      trailing: Text(currentLanguage!.displayedName,
          style: TextStyles.rubik12W600MediumGrey12),
      onTap: () {
        context.push(const ChooseLanguagesScreen());
        // Handle tile tap if needed
      },
    );
  }
}
