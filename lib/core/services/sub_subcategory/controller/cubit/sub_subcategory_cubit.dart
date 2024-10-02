import 'package:bloc/bloc.dart';
import 'package:bulka/core/services/sub_subcategory/controller/cubit/sub_subcategory_state.dart';
import 'package:bulka/core/services/sub_subcategory/data/entity/sub_subcategory_entity.dart';
import 'package:bulka/core/services/sub_subcategory/data/params/sub_subcategory_params.dart';
import 'package:bulka/core/services/sub_subcategory/data/repo/sub_subcategory_repo.dart';

class SubSubcategoryCubit extends Cubit<SubSubcategoryState> {
  final SubSubcategoryRepo _subSubcategoryRepo;
  SubSubcategoryCubit(this._subSubcategoryRepo)
      : super(SubSubcategoryInitial());
//---------------------------------VARIABLES----------------------------------//
  List<SubSubcategoryEntity>? subcategories;
//---------------------------------FUNCTIONS----------------------------------//

//----------------------------------REQUEST-----------------------------------//
  Future<void> subSubcategoryStatesHandled(SubSubcategoryParams params) async {
    emit(const GetSubSubcategoryLoading());
    final response = await _subSubcategoryRepo.subSubcategory(params);
    response.fold((failure) {
      return emit(GetSubSubcategoryError(failure));
    }, (success) async {
      subcategories = success;
      return emit(GetSubSubcategorySuccess(success));
    });
  }
}
