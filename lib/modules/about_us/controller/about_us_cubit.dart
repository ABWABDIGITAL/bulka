import 'package:bloc/bloc.dart';
import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/modules/about_us/data/entities/about_us_entity.dart';
import 'package:bulka/modules/about_us/data/entities/terms_params.dart';
import 'package:bulka/modules/about_us/data/repo/about_us_repo.dart';
import 'package:equatable/equatable.dart';

part 'about_us_state.dart';

class AboutUsCubit extends Cubit<AboutUsState> {
  final AboutUsRepo _aboutUsRepo;
  AboutUsCubit(this._aboutUsRepo) : super(AboutUsInitial());

  //----------------------------------------variables----------------------------------------//
  //----------------------------------------functions----------------------------------------//
  //----------------------------------------requests----------------------------------------//

  void getSocialLinks() async {
    emit(AboutUsLoading());
    final response = await _aboutUsRepo.getSocialLinks();
    response.fold(
      (error) => emit(AboutUsError(error)),
      (data) => emit(AboutUsLoaded(data)),
    );
  }

  void getTerms() async {
    emit(TermsLoading());
    final response = await _aboutUsRepo.getTerms();
    response.fold(
      (error) => emit(TermsError(error)),
      (data) => emit(TermsLoaded(data)),
    );
  }
}
