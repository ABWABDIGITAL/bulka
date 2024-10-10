import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/modules/see_all_ad/data/entity/see_all_entity.dart';

sealed class SeeAllAdState {
  const SeeAllAdState();
}

final class SeeAllAdInitial extends SeeAllAdState {}

final class SeeAllAdLoading extends SeeAllAdState {
  const SeeAllAdLoading();
}

final class SeeAllAdSuccess extends SeeAllAdState {
  SeeAllAdSuccess(this.seeAllEntity);
  final SeeAllEntity seeAllEntity;
}

final class SeeAllAdError extends SeeAllAdState {
  SeeAllAdError(this.error);
  final ApiErrorEntity error;
}
