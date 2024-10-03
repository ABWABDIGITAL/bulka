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

  Future<Map<String, dynamic>> returnedMap() async {
    List<Map<String, dynamic>> fields = [];
    for (var element in createAdCategoryField) {
      fields.add(element.returnMap());
    }
    List<Map<String, dynamic>> mediaList = [];
    for (File element in media) {
      final multipart = await MultipartFile.fromFile(element.path);
      mediaList.add({"media": multipart});
    }
    Map<String, dynamic> map = {
      "category_id": categoryId,
      "sub_category_id": subcategoryId,
      "sub_sub_category_id": subSubcategoryId,
      "price": price,
      "ad_type": adType.toString().split('.').last,
      "prefered_contact": preferedContact.toString().split('.').last,
      "name": name,
      "description": description,
      "ad_category_fields": fields,
      "media": mediaList,
      "lat": lat,
      "lng": lng,
      "location": location,
    };
    map.removeWhere((key, value) => value == null);
    return map;
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
  final String fieldValue;
  final String fieldType;

  Map<String, dynamic> returnMap() {
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
