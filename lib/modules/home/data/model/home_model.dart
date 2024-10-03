import 'package:bulka/core/services/categories/data/model/category_type_model.dart';
import 'package:bulka/core/shared/models/slider_model.dart';
import 'package:bulka/core/utils/home_utilites.dart';
import 'package:bulka/modules/home/data/entity/home_entity.dart';
import 'package:bulka/modules/home/data/model/home_product_model.dart';

class HomeModel extends HomeEntity {
  const HomeModel({
    required super.sliders,
    required super.categories,
    required super.properties,
    required super.cars,
    required super.jobs,
    required super.importAndExport,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      sliders: checkFromArray(json['slider'])
          ? (json['slider'] as List)
              .map((e) => SliderModel.fromJson(e))
              .toList()
          : [],
      categories: checkFromArray(json['categories_types'])
          ? (json['categories_types'] as List)
              .map((e) => CategoryTypeModel.fromJson(e))
              .toList()
          : [],
      properties: checkFromArray(json['ads']['properties'])
          ? (json['ads']['properties'] as List)
              .map((e) => HomeProductModel.fromJson(e))
              .toList()
          : [],
      cars: checkFromArray(json['ads']['cars'])
          ? (json['ads']['cars'] as List)
              .map((e) => HomeProductModel.fromJson(e))
              .toList()
          : [],
      jobs: checkFromArray(json['ads']['jobs'])
          ? (json['ads']['jobs'] as List)
              .map((e) => HomeProductModel.fromJson(e))
              .toList()
          : [],
      importAndExport: checkFromArray(json['ads']['import_and_export'])
          ? (json['ads']['import_and_export'] as List)
              .map((e) => HomeProductModel.fromJson(e))
              .toList()
          : [],
    );
  }
}
