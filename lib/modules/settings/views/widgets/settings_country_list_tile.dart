import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SettingsCountryListTile extends StatelessWidget {
  const SettingsCountryListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset(AssetIcons.countrySvg),
      title: Text('country', style: TextStyles.rubik13W400Black),
      trailing: SvgPicture.asset(currentLanguage!.flag),
      onTap: () {
        // Handle tile tap if needed
      },
    );
  }
}
