import 'package:bloc/bloc.dart';
import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/modules/faq/data/entities/faq_entity.dart';
import 'package:bulka/modules/faq/data/repo/faq_repo.dart';
import 'package:equatable/equatable.dart';

part 'faq_state.dart';

class FaqCubit extends Cubit<FaqState> {
  FaqCubit( this._faqRepo) : super(FaqInitial());
//-----------------------------------variables-----------------------------------//
FaqRepo _faqRepo;
//-----------------------------------functions-----------------------------------//
//-----------------------------------requests-----------------------------------//

  void getFaqs() async {
    emit(FaqLoading());
     final response = await _faqRepo.getFaqs();
     response.fold(
       (error) => emit(FaqError(error)),
       (faqs) {
         emit(FaqLoaded(faqs));
       },
     );
  }
}
