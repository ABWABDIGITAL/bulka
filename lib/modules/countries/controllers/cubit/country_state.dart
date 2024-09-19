import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/modules/countries/data/entity/country_entity.dart';

sealed class CountryState {
  const CountryState();
}

final class CountryInitial extends CountryState {}

final class GetCountriesLoading extends CountryState {
  const GetCountriesLoading();
}

final class GetCountriesSuccess extends CountryState {
  GetCountriesSuccess(this.countries);
  final List<CountryEntity> countries;
}

final class GetCountriesError extends CountryState {
  GetCountriesError(this.error);
  final ApiErrorEntity error;
}
