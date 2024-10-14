import 'dart:io';

import 'package:bulka/core/utils/enums/enums.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

class CreateAdParams extends Equatable {
  const CreateAdParams({
    required this.categoryId,
    required this.price,
    required this.adType,
    required this.preferedContact,
    required this.name,
    required this.description,
    required this.createAdCategoryField,
    required this.media,
    required this.lat,
    required this.lng,
    required this.location,
    required this.subcategoryId,
    required this.subSubcategoryId,
    required this.isPromoted,
  });
  final int? categoryId;
  final int? subcategoryId;
  final int? subSubcategoryId;
  final String? price;
  final AdType? adType;
  final PreferedContact? preferedContact;
  final String? name;
  final String? description;
  final List<CreateAdCategoryField> createAdCategoryField;
  final List<File> media;
  final String? lat;
  final String? lng;
  final String? location;
  final bool isPromoted;

  Future<Map<String, dynamic>> returnedMap() async {
    List<Map<String, dynamic>> fields = [];

    for (var element in createAdCategoryField) {
      fields.add(element.returnMap());
    }
    List<MultipartFile> mediaList = [];
    for (File element in media) {
      final multipart = await MultipartFile.fromFile(element.path);
      mediaList.add(multipart);
    }

    Map<String, dynamic> map = {
      "category_id": categoryId,
      "sub_category_id": subcategoryId,
      "sub_sub_category_id": subSubcategoryId,
      "price": price,
      "ad_type": adType!.name,
      "preferred_contact": preferedContact!.name,
      "name": name,
      "description": description,
      "ad_category_fields": fields,
      "lat": lat,
      "lng": lng,
      "location": location,
      "ad_media": mediaList,
      "is_promoted": isPromoted ? 1 : 0,
    };
    map.removeWhere((key, value) => value == null);
    return map;
  }

  Map<String, dynamic> returnDataFromMapValue() {
    Map<String, dynamic> map = {
      "category_id": categoryId,
      "sub_category_id": subcategoryId,
      "sub_sub_category_id": subSubcategoryId,
      "price": price,
      "ad_type": adType!.name,
      "preferred_contact": preferedContact!.name,
      "name": name,
      "description": description,
      "lat": lat,
      "lng": lng,
      "location": location,
      "is_promoted": isPromoted ? 1 : 0,
    };
    map.removeWhere((key, value) => value == null);
    return map;
  }

  List<MapEntry<String, String>> addCategoryFieldToFields() {
    FormData formData = FormData();
    int index = 0;
    for (CreateAdCategoryField item in createAdCategoryField) {
      formData.fields
          .add(MapEntry("ad_category_fields[$index][id]", item.id.toString()));
      formData.fields.add(MapEntry(
          "ad_category_fields[$index][field_name]", item.fieldName.toString()));
      formData.fields.add(MapEntry(
          "ad_category_fields[$index][field_type]", item.fieldType.toString()));

      if (item.fieldValue is List) {
        int idx = 0;
        for (var element in item.fieldValue) {
          formData.fields.add(MapEntry(
              "ad_category_fields[$index][field_values][$idx]",
              element.toString()));
          idx++;
        }
      } else {
        formData.fields.add(MapEntry(
            "ad_category_fields[$index][field_values]", item.toString()));
      }

      index++;
    }
    return formData.fields;
  }

  Future<List<MapEntry<String, MultipartFile>>> mediaFormData() async {
    FormData formData = FormData();
    int index = 0;
    for (var item in media) {
      MultipartFile file = await MultipartFile.fromFile(item.path);
      formData.files.add(MapEntry('ad_media[$index]', file));
      index++;
    }

    return formData.files;
  }

  Future<FormData> returnFormData() async {
    FormData finalFormData = FormData.fromMap(returnDataFromMapValue());

    final mediasss = await mediaFormData();
    finalFormData.files.addAll(mediasss);

    final categoryFields = addCategoryFieldToFields();
    finalFormData.fields.addAll(categoryFields);
    return finalFormData;
  }

  @override
  List<Object?> get props => [
        categoryId,
        subcategoryId,
        subSubcategoryId,
        price,
        adType,
        preferedContact,
        name,
        description,
        createAdCategoryField,
        media,
        lat,
        lng,
        location
      ];
}

class CreateAdCategoryField extends Equatable {
  const CreateAdCategoryField({
    required this.id,
    required this.fieldName,
    required this.fieldValue,
    required this.fieldType,
  });
  final int id;
  final String fieldName;
  final dynamic fieldValue;
  final String fieldType;

  Map<String, dynamic> returnMap() {
    if (fieldValue is List) {
      List<String> values = [];
      Map<String, dynamic> map = {
        "id": id,
        "field_name": fieldName,
        "field_type": fieldType,
      };
      int index = 0;
      for (var element in fieldValue) {
        map.addAll({"field_values[$index]": element.toString()});
        index++;
      }
      return map;
    }
    Map<String, dynamic> map = {
      "id": id,
      "field_name": fieldName,
      "field_values": fieldValue,
      "field_type": fieldType,
    };
    map.removeWhere((key, value) => value == null);
    return map;
  }

  @override
  List<Object?> get props => [id, fieldName, fieldValue, fieldType];
}
