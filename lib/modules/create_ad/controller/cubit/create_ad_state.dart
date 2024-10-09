import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/modules/create_ad/data/entity/buying_ad_entity.dart';
import 'package:bulka/modules/create_ad/data/entity/create_ad_entity.dart';

sealed class CreateAdState {
  const CreateAdState();
}

final class CreateAdInitial extends CreateAdState {}

final class CreateAdLoading extends CreateAdState {
  const CreateAdLoading();
}

final class CreateAdSuccess extends CreateAdState {
  final CreateAdEntity createAdEntity;
  const CreateAdSuccess(this.createAdEntity);
}

final class CreateAdError extends CreateAdState {
  final ApiErrorEntity error;
  const CreateAdError(this.error);
}

final class BuyingAdLoading extends CreateAdState {
  const BuyingAdLoading();
}

final class BuyingAdSuccess extends CreateAdState {
  final BuyingAdEntity buyingAdEntity;
  const BuyingAdSuccess(this.buyingAdEntity);
}

final class BuyingAdError extends CreateAdState {
  final ApiErrorEntity error;
  const BuyingAdError(this.error);
}
