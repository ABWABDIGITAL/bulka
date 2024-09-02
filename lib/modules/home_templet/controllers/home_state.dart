import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/modules/home_templet/data/entity/banner_entity.dart';

sealed class HomeState {}

final class HomeStateInitial extends HomeState {}

final class GetHomeBannersLoadingState extends HomeState {}

final class GetHomeBannersSuccessState extends HomeState {
  GetHomeBannersSuccessState(this.banners);
  final List<BannerEntity> banners;
}

final class GetHomeBannersErrorState extends HomeState {
  GetHomeBannersErrorState(this.error);
  final ApiErrorEntity error;
}
