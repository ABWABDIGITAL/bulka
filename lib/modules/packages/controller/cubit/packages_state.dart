import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/modules/packages/data/entity/packages_entity.dart';
import 'package:bulka/modules/packages/data/entity/pay_subscribtion_entity.dart';
import 'package:bulka/modules/packages/data/entity/subscribe_entity.dart';

sealed class PackagesState {
  const PackagesState();
}

final class PackagesInitial extends PackagesState {}

final class GetPackagesLoading extends PackagesState {
  const GetPackagesLoading();
}

final class GetPackagesSuccess extends PackagesState {
  const GetPackagesSuccess(this.packages);
  final List<PackagesEntity> packages;
}

final class GetPackagesError extends PackagesState {
  final ApiErrorEntity error;
  const GetPackagesError(this.error);
}

final class GetSubscribeLoading extends PackagesState {
  const GetSubscribeLoading();
}

final class GetSubscribeSuccess extends PackagesState {
  const GetSubscribeSuccess(this.subscribe);
  final SubscribeEntity subscribe;
}

final class GetSubscribeError extends PackagesState {
  final ApiErrorEntity error;
  const GetSubscribeError(this.error);
}

final class PaySubscribtionLoading extends PackagesState {
  const PaySubscribtionLoading();
}

final class PaySubscribtionSuccess extends PackagesState {
  const PaySubscribtionSuccess(this.paySubscribtion);
  final PaySubscribtionEntity paySubscribtion;
}

final class PaySubscribtionError extends PackagesState {
  final ApiErrorEntity error;
  const PaySubscribtionError(this.error);
}
