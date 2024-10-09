import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'ad_details_state.dart';

class AdDetailsCubit extends Cubit<AdDetailsState> {
  AdDetailsCubit() : super(AdDetailsInitial());
}
