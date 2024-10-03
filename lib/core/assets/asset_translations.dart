import 'dart:convert';

import 'package:bulka/core/assets/asset_flags.dart';
import 'package:bulka/core/services/cache/shared_pref.dart';
import 'package:bulka/core/utils/constant/shared_pref_keys.dart';
import 'package:bulka/core/utils/constant/strings.dart';
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

  static Future<void> saveLanguage(LanguageConfig language) async {
    String encodedLang = jsonEncode(language.toJson);
    await SharedPrefHelper.setData(SharedPrefKeys.savedLang, encodedLang);
  }

  static Future<LanguageConfig> getLanguage() async {
    final lang = await SharedPrefHelper.getData(SharedPrefKeys.savedLang);

    if (lang != null) {
      currentLanguage = LanguageConfig.fromJson(json.decode(lang));

      return LanguageConfig.fromJson(json.decode(lang));
    } else {
      currentLanguage = _startedLanguage;
      return _startedLanguage;
    }
  }

  static final List mySupportedLanguages = [
    emirates,
    english,
    russian,
  ];
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

  Map<String, dynamic> get toJson => {
        'displayedName': displayedName,
        'countryName': countryName,
        'locale': locale.languageCode,
        'flag': flag,
        'currency': currency,
      };

  factory LanguageConfig.fromJson(Map<String, dynamic> json) {
    return LanguageConfig(
      displayedName: json['displayedName'],
      countryName: json['countryName'],
      locale: Locale(json['locale']),
      flag: json['flag'],
      currency: json['currency'],
    );
  }

  @override
  List<Object?> get props =>
      [displayedName, countryName, locale, flag, currency];
}
