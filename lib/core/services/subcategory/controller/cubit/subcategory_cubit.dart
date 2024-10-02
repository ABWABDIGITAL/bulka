import 'package:bloc/bloc.dart';
import 'package:bulka/core/services/subcategory/controller/cubit/subcategory_state.dart';
import 'package:bulka/core/services/subcategory/data/entity/subcategory_entity.dart';
import 'package:bulka/core/services/subcategory/data/params/subcategory_params.dart';
import 'package:bulka/core/services/subcategory/data/repo/subcategory_repo.dart';

class SubcategoryCubit extends Cubit<SubcategoryState> {
  final SubcategoryRepo _subcategoryRepo;
  SubcategoryCubit(this._subcategoryRepo) : super(SubcategoryInitial());
//---------------------------------VARIABLES----------------------------------//
  List<SubcategoryEntity>? subcategories;
//---------------------------------FUNCTIONS----------------------------------//

//----------------------------------REQUEST-----------------------------------//
  Future<void> subcategoryStatesHandled(SubcategoryParams params) async {
    emit(const GetSubcategoryLoading());
    final response = await _subcategoryRepo.subcategory(params);
    response.fold((failure) {
      return emit(GetSubcategoryError(failure));
    }, (success) async {
      subcategories = success;
      return emit(GetSubcategorySuccess(success));
    });
  }
}
