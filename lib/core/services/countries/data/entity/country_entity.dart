import 'package:equatable/equatable.dart';

class CountryEntity extends Equatable {
  const CountryEntity({
    required this.id,
    required this.phoneCode,
    required this.phoneLimit,
    required this.flag,
    required this.name,
    required this.countryCodeByName,
    required this.countryCodeByDial,
  });

  final int id;
  final String phoneCode;
  final String phoneLimit;
  final String flag;
  final String name;
  final String countryCodeByName;
  final String countryCodeByDial;

  @override
  List<Object?> get props => [
        id,
        phoneCode,
        phoneLimit,
        flag,
        name,
        countryCodeByName,
        countryCodeByDial
      ];
}
