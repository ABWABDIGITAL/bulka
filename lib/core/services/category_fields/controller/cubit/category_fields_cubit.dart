import 'package:bloc/bloc.dart';
import 'package:bulka/core/services/category_fields/controller/cubit/category_fields_state.dart';
import 'package:bulka/core/services/category_fields/data/entity/category_field_entity.dart';
import 'package:bulka/core/services/category_fields/data/params/category_field_params.dart';
import 'package:bulka/core/services/category_fields/data/repo/category_field_repo.dart';

class CategoryFieldsCubit extends Cubit<CategoryFieldsState> {
  final CategoryFieldRepo _categoryFieldRepo;
  CategoryFieldsCubit(this._categoryFieldRepo) : super(CategoryFieldsInitial());
//---------------------------------VARIABLES----------------------------------//
  List<CategoryFieldEntity>? categoryFields;

//---------------------------------FUNCTIONS----------------------------------//

//----------------------------------REQUEST-----------------------------------//
  Future<void> categoryFieldsStatesHandled(CategoryFieldParams params) async {
    emit(const GetCategoryFieldsLoading());
    final response = await _categoryFieldRepo.categoryFields(params);
    response.fold((failure) {
      return emit(GetCategoryFieldsError(failure));
    }, (success) {
      categoryFields = success;
      return emit(GetCategoryFieldsSuccess(success));
    });
  }
}
