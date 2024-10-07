import 'package:bloc/bloc.dart';
import 'package:bulka/core/services/category_fields/controller/cubit/category_fields_state.dart';
import 'package:bulka/core/services/category_fields/data/entity/category_field_entity.dart';
import 'package:bulka/core/services/category_fields/data/params/category_field_params.dart';
import 'package:bulka/core/services/category_fields/data/repo/category_field_repo.dart';
import 'package:bulka/modules/create_ad/data/params/create_ad_params.dart';
import 'package:flutter/material.dart';

class CategoryFieldsCubit extends Cubit<CategoryFieldsState> {
  final CategoryFieldRepo _categoryFieldRepo;
  CategoryFieldsCubit(this._categoryFieldRepo) : super(CategoryFieldsInitial());
//---------------------------------VARIABLES----------------------------------//
  List<CategoryFieldEntity>? categoryFields;
  List<CreateAdCategoryField> _selectedCategoriesFields = [];
  List<GlobalKey<FormState>> _dynamicKeys = [];

//---------------------------------FUNCTIONS----------------------------------//
  set setSelectedCategoriesFields(CreateAdCategoryField value) =>
      _selectedCategoriesFields.add(value);

  List<CreateAdCategoryField> get selectedCategoriesFields {
    Map<int, CreateAdCategoryField> uniqueFields = {};

    for (var field in _selectedCategoriesFields) {
      uniqueFields[field.id] = field;
    }

    return uniqueFields.values.toList();
  }

  List<GlobalKey<FormState>> get dynamicKeys => _dynamicKeys;

//----------------------------------REQUEST-----------------------------------//
  Future<void> categoryFieldsStatesHandled(CategoryFieldParams params) async {
    emit(const GetCategoryFieldsLoading());
    final response = await _categoryFieldRepo.categoryFields(params);
    response.fold((failure) {
      return emit(GetCategoryFieldsError(failure));
    }, (success) {
      categoryFields = success;
      _dynamicKeys.clear();
      _dynamicKeys =
          List.generate(categoryFields!.length, (_) => GlobalKey<FormState>());
      return emit(GetCategoryFieldsSuccess(success));
    });
  }
}
