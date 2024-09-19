import 'package:bulka/core/services/api_handler/api_error_handler.dart';
import 'package:bulka/core/services/network/dio_helper.dart';
import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/core/utils/constant/api_constance.dart';
import 'package:bulka/core/utils/home_utilites.dart';
import 'package:bulka/modules/countries/data/entity/country_entity.dart';
import 'package:bulka/modules/countries/data/model/country_model.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class CountryRepo extends Equatable {
  const CountryRepo();
  Future<Either<ApiErrorEntity, List<CountryEntity>>> countries() async {
    try {
      final response = await DioHelper.get(ApiConstance.countries);

      final List<CountryEntity> countries =
          checkFromArray(response.data['data'])
              ? (response.data['data'] as List)
                  .map((e) => CountryModel.fromJson(e))
                  .toList()
              : [];

      return Right(countries);
    } catch (error) {
      return Left(ErrorHandler.handleError(error));
    }
  }

  @override
  List<Object?> get props => [];
}
