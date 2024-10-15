part of 'offers_cubit.dart';

sealed class OffersState extends Equatable {
  const OffersState();

  @override
  List<Object> get props => [];
}
//--------------------------------------------Offers banner--------------------------------------------//

final class OffersInitial extends OffersState {}

final class OffersBannerLoading extends OffersState {}

final class OffersBannerLoaded extends OffersState {
  final List<OffersBannerEntity> offersBanner;

  const OffersBannerLoaded(this.offersBanner);

  @override
  List<Object> get props => [offersBanner];
}

final class OffersBannerError extends OffersState {
  final ApiErrorEntity error;

  const OffersBannerError(this.error);

  @override
  List<Object> get props => [error];
}

//--------------------------------------------Offers--------------------------------------------//

final class OffersLoading extends OffersState {}

final class OffersLoaded extends OffersState {
  final List<OffersEntity> offers;

  const OffersLoaded(this.offers);

  @override
  List<Object> get props => [offers];
}

final class OffersError extends OffersState {
  final ApiErrorEntity error;

  const OffersError(this.error);

  @override
  List<Object> get props => [error];
}
