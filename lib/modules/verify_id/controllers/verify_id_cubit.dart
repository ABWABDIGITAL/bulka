import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'verify_id_state.dart';

class VerifyIdCubit extends Cubit<VerifyIdState> {
  VerifyIdCubit() : super(VerifyIdInitial());
  
}
