import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:bulka/core/services/sub_subcategory/controller/cubit/sub_subcategory_cubit.dart';
import 'package:bulka/core/services/sub_subcategory/data/params/sub_subcategory_params.dart';
import 'package:bulka/core/services/subcategory/controller/cubit/subcategory_cubit.dart';
import 'package:bulka/core/services/subcategory/data/params/subcategory_params.dart';
import 'package:bulka/core/utils/enums/enums.dart';
import 'package:bulka/modules/create_ad/controller/cubit/create_ad_state.dart';
import 'package:bulka/modules/create_ad/data/params/create_ad_params.dart';
import 'package:bulka/modules/create_ad/data/repo/create_ad_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateAdCubit extends Cubit<CreateAdState> {
  final CreateAdRepo _createAdRepo;
  CreateAdCubit(this._createAdRepo) : super(CreateAdInitial());
//---------------------------------VARIABLES----------------------------------//
  int? _categoryId, _subcategoryId, _subSubcategoryId;
  String? _lat, _lng, _location;
  AdType? _adType;
  PreferedContact? _preferedContact;

  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  List<CreateAdCategoryField> _adCategoriesField = [];
  List<File> _media = [];
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  List<GlobalKey<FormState>> _dynamicKeys = [];
  List<CreateAdCategoryField> _selectedCategoriesFields = [];
//---------------------------------FUNCTIONS----------------------------------//
  set categoryId(int value) => _categoryId = value;
  set subcategoryId(int value) => _subcategoryId = value;
  set subSubcategoryId(int value) => _subSubcategoryId = value;
  set adType(AdType value) => _adType = value;
  set preferedContact(PreferedContact value) => _preferedContact = value;
  set setLat(String value) => _lat = value;
  set setLng(String value) => _lng = value;
  set setLocation(String value) => _location = value;
  set setMedia(List<File> value) => _media = value;
  set setAdCategoriesField(List<CreateAdCategoryField> value) =>
      _adCategoriesField = value;
  set setDynamicKeys(int length) {
    _dynamicKeys = [];
    _dynamicKeys = List.generate(length, (_) => GlobalKey<FormState>());
  }

  set setSelectedCategoriesFields(CreateAdCategoryField value) =>
      _selectedCategoriesFields.add(value);

  List<CreateAdCategoryField> get selectedCategoriesFields {
    return _selectedCategoriesFields.toSet().toList();
  }

  List<GlobalKey<FormState>> get dynamicKeys => _dynamicKeys;

  void getSubcategoryByCategory(BuildContext context) {
    if (_categoryId != null) {
      context
          .read<SubcategoryCubit>()
          .subcategoryStatesHandled(SubcategoryParams(categoryId: _categoryId));
    }
  }

  SubcategoryParams? getSubcategoryParams() {
    if (_categoryId == null) return null;
    return SubcategoryParams(categoryId: _categoryId!);
  }

  void getSubSubcategoryBySubCategory(BuildContext context) {
    if (_subcategoryId != null) {
      context.read<SubSubcategoryCubit>().subSubcategoryStatesHandled(
          SubSubcategoryParams(subcategoryId: _subcategoryId));
    }
  }

  SubSubcategoryParams? getSubSubcategoryParams() {
    if (_categoryId == null) return null;
    return SubSubcategoryParams(subcategoryId: _subcategoryId);
  }

//----------------------------------REQUEST-----------------------------------//
  Future<void> createAdStatesHandled(CreateAdParams params) async {
    emit(const CreateAdLoading());
    final response = await _createAdRepo.createAd(
      CreateAdParams(
        categoryId: _categoryId,
        price: priceController.text,
        subcategoryId: _subcategoryId,
        subSubcategoryId: _subSubcategoryId,
        adType: _adType,
        preferedContact: _preferedContact,
        name: nameController.text,
        description: descriptionController.text,
        createAdCategoryField: _adCategoriesField,
        media: _media,
        lat: _lat,
        lng: _lng,
        location: _location,
      ),
    );
    response.fold((failure) {
      return emit(CreateAdError(failure));
    }, (success) async {
      return emit(CreateAdSuccess(success));
    });
  }
}
