import 'package:bulka/core/assets/asset_flags.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class AssetTranslations {
  static bool isRightDirectionality =
      _startedLanguage.locale.languageCode == 'ar' ? true : false;
  static final LanguageConfig _startedLanguage = english;
  static const String translationPath = 'assets/translations';

  static LanguageConfig russian = const LanguageConfig(
    displayedName: 'Russian',
    countryName: 'Russia',
    locale: Locale('ru'),
    flag: AssetFlags.russian,
    currency: 'Russian Rubel',
  );
  static LanguageConfig emirates = const LanguageConfig(
    displayedName: 'Arabic',
    countryName: 'Emirates',
    locale: Locale('ar'),
    flag: AssetFlags.emirates,
    currency: 'AED',
  );
  static LanguageConfig english = const LanguageConfig(
    displayedName: 'English',
    countryName: 'United Kingdom',
    locale: Locale('en'),
    flag: AssetFlags.unitedKingdom,
    currency: '£',
  );

  // static void saveLanguage(LanguageConfig language) {
  //   SharedPrefHelper.setData(SharedPrefKeys.savedLang, language);
  // }

  // static LanguageConfig getLanguage() {
  //   return SharedPrefHelper.getData(SharedPrefKeys.savedLang) ??
  //       _startedLanguage;
  // }
}

class LanguageConfig extends Equatable {
  const LanguageConfig({
    required this.displayedName,
    required this.countryName,
    required this.locale,
    required this.flag,
    required this.currency,
  });
  final String displayedName;
  final String countryName;
  final Locale locale;
  final String flag;
  final String currency;

  @override
  List<Object?> get props =>
      [displayedName, countryName, locale, flag, currency];
}
