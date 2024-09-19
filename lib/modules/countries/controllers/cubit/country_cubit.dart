import 'package:bloc/bloc.dart';
import 'package:bulka/modules/countries/controllers/cubit/country_state.dart';
import 'package:bulka/modules/countries/data/entity/country_entity.dart';
import 'package:bulka/modules/countries/data/repo/country_repo.dart';

class CountryCubit extends Cubit<CountryState> {
  final CountryRepo _countryRepo;
  CountryCubit(this._countryRepo) : super(CountryInitial());
//---------------------------------VARIABLES----------------------------------//
  List<CountryEntity>? _countries;

//---------------------------------FUNCTIONS----------------------------------//
  List<CountryEntity>? get countries => _countries;

  void setCountries(List<CountryEntity> countries) {
    _countries = countries;
  }

//----------------------------------REQUEST-----------------------------------//
  Future<void> countriesStatesHandled() async {
    emit(const GetCountriesLoading());
    final response = await _countryRepo.countries();
    response.fold((failure) {
      return emit(GetCountriesError(failure));
    }, (success) async {
      setCountries(success);
      return emit(GetCountriesSuccess(success));
    });
  }
}
