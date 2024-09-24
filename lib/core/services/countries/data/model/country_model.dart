import 'package:bulka/core/services/countries/data/entity/country_entity.dart';
import 'package:bulka/core/services/countries/data/helpers/country_helpers.dart';

class CountryModel extends CountryEntity {
  const CountryModel({
    required super.id,
    required super.phoneCode,
    required super.phoneLimit,
    required super.flag,
    required super.name,
    required super.countryCodeByName,
    required super.countryCodeByDial,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      id: json['id'],
      phoneCode: json['phone_code'],
      phoneLimit: json['phone_limit'],
      flag: json['flag'],
      name: json['name'],
      countryCodeByName: CountryHelpers.getCountryCodeByName(json['name']),
      countryCodeByDial:
          CountryHelpers.getCountryCodeByDialCode(json['phone_code']),
    );
  }
}
