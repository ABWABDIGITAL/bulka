import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'offers_state.dart';

class OffersCubit extends Cubit<OffersState> {
  OffersCubit() : super(OffersInitial());
}
