import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/constant/strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CountryListTile extends StatelessWidget {
  const CountryListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset(AssetIcons.country),
      title: Text(AppStrings.country.tr(), style: TextStyles.rubik13W400Black),
      trailing: SvgPicture.asset(currentLanguage!.flag),
      onTap: () {
        // Handle tile tap if needed
      },
    );
  }
}
