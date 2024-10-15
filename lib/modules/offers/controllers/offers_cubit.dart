import 'package:bloc/bloc.dart';
import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/modules/offers/data/entities/offers_banner_entity.dart';
import 'package:bulka/modules/offers/data/entities/offers_entity.dart';
import 'package:bulka/modules/offers/data/repo/offers_repo.dart';
import 'package:equatable/equatable.dart';

part 'offers_state.dart';

class OffersCubit extends Cubit<OffersState> {
  final OffersRepo _offersRepo;
  OffersCubit(this._offersRepo) : super(OffersInitial());
  //-----------------------------------------variables-----------------------------------------//
  //-----------------------------------------functions------------------------------------------//
  //-----------------------------------------requests-----------------------------------------//

  void getOffersBanner() async {
    emit(OffersBannerLoading());
    final response = await _offersRepo.getOffersBanner();
    response.fold(
      (error) => emit(OffersBannerError(error)),
      (data) => emit(OffersBannerLoaded(data)),
    );
  }

  void getOffers() async {
    emit(OffersLoading());
    final response = await _offersRepo.getOffers();
    response.fold(
      (error) => emit(OffersError(error)),
      (data) => emit(OffersLoaded(data)),
    );
  }
}
