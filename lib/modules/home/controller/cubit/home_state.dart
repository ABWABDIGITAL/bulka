import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/modules/home/data/entity/home_entity.dart';

sealed class HomeState {
  const HomeState();
}

final class HomeInitial extends HomeState {}

final class GetHomeLoading extends HomeState {
  const GetHomeLoading();
}

final class GetHomeSuccess extends HomeState {
  GetHomeSuccess(this.homeEntity);
  final HomeEntity homeEntity;
}

final class GetHomeError extends HomeState {
  GetHomeError(this.error);
  final ApiErrorEntity error;
}
