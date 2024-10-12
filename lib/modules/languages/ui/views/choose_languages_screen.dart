import 'package:bulka/core/assets/asset_translations.dart';
import 'package:bulka/core/shared/widgets/appbar_widget.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/constant/strings.dart';
import 'package:bulka/core/utils/widgets/buttons/default_button.dart';
import 'package:bulka/core/utils/widgets/misc/restart_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChooseLanguagesScreen extends StatefulWidget {
  const ChooseLanguagesScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ChooseLanguagesScreenState createState() => _ChooseLanguagesScreenState();
}

class _ChooseLanguagesScreenState extends State<ChooseLanguagesScreen> {
  LanguageConfig? _selectedLanguage;

  @override
  Future<void> didChangeDependencies() async {
    if (mounted) {
      _selectedLanguage = await AssetTranslations.getLanguage();
      setState(() {});
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: OpacityAppbarWidget(title: AppStrings.languages.tr()),
      body: Padding(
        padding: EdgeInsets.all(12.r),
        child: Column(
          children: [
            Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(color: AppColors.grey),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  AssetTranslations.mySupportedLanguages.length,
                  (index) {
                    return _buildLanguageOption(
                      AssetTranslations.mySupportedLanguages[index],
                    ).animate().fade(delay: (index * 300).ms);
                  },
                ),
              ),
            ),
            vSpace(20),
            DefaultButton(
              backgroundColor: const Color(0xFF00AF54),
              borderColor: const Color(0xFF00AF54),
              borderRadiusValue: 10.r,
              onPressed: () async {
                currentLanguage = _selectedLanguage;
                await AssetTranslations.saveLanguage(_selectedLanguage!)
                    .then((value) async {
                  await context
                      .setLocale(currentLanguage!.locale)
                      .then((_) => RestartWidget.restartApp(context));
                });
              },
              child: Text(
                AppStrings.confirm.tr(),
                style: TextStyles.rubik14W400Black2
                    .copyWith(color: AppColors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageOption(LanguageConfig lang) {
    return Container(
      decoration: BoxDecoration(
        color: _selectedLanguage?.displayedName == lang.displayedName
            ? const Color.fromARGB(255, 170, 239, 202)
            : Colors.white,
      ),
      child: RadioListTile<LanguageConfig>(
        controlAffinity: ListTileControlAffinity.leading,
        title: Row(
          children: [
            Expanded(
              child: Text(
                lang.displayedName,
                style: TextStyles.rubik14W400Black2,
              ),
            ),
            SvgPicture.asset(
              lang.flag,
              height: 25,
              width: 25,
            ),
          ],
        ),
        value: lang,
        groupValue: _selectedLanguage,
        activeColor: const Color(0xFF00AF54),
        onChanged: (LanguageConfig? newValue) {
          setState(() {
            _selectedLanguage = newValue!;
          });
        },
      ),
    );
  }
}
