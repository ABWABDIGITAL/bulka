import 'package:bloc/bloc.dart';
import 'package:bulka/core/services/categories/controller/category_state.dart';
import 'package:bulka/core/services/categories/data/entity/category_entity.dart';
import 'package:bulka/core/services/categories/data/params/category_params.dart';
import 'package:bulka/core/services/categories/data/repo/category_repo.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final CategoryRepo _categoryRepo;
  CategoryCubit(this._categoryRepo) : super(const CategoryInitial());
//---------------------------------VARIABLES----------------------------------//
  List<CategoryEntity>? categories;
//---------------------------------FUNCTIONS----------------------------------//
//----------------------------------REQUEST-----------------------------------//
  Future<void> catgoriesStatesHandled({CategoryParams? category}) async {
    emit(const GetCategoriesLoading());
    final response = await _categoryRepo.categories(category: category);
    response.fold((failure) {
      return emit(GetCategoriesError(failure));
    }, (success) async {
      categories = success;
      return emit(GetCategoriesSuccess(success));
    });
  }
}
