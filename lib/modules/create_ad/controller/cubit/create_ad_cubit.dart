import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:bulka/core/utils/enums/enums.dart';
import 'package:bulka/modules/create_ad/controller/cubit/create_ad_state.dart';
import 'package:bulka/modules/create_ad/data/params/create_ad_params.dart';
import 'package:bulka/modules/create_ad/data/repo/create_ad_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CreateAdCubit extends Cubit<CreateAdState> {
  final CreateAdRepo _createAdRepo;
  CreateAdCubit(this._createAdRepo) : super(CreateAdInitial());
//---------------------------------VARIABLES----------------------------------//
  int? _categoryId;
  int? _subcategoryId;
  int? _subSubcategoryId;
  AdType? _adType;
  PreferedContact? _preferedContact;
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  List<CreateAdCategoryField> adCategoriesField = [];
  List<File> media = [];
  String? lat;
  String? lng;
  String? location;
//---------------------------------FUNCTIONS----------------------------------//

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
        createAdCategoryField: adCategoriesField,
        media: media,
        lat: lat,
        lng: lng,
        location: location,
      ),
    );
    response.fold((failure) {
      return emit(CreateAdError(failure));
    }, (success) async {
      return emit(CreateAdSuccess(success));
    });
  }
}
