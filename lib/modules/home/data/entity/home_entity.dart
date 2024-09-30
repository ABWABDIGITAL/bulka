import 'package:bulka/core/services/categories/data/entity/category_type_entity.dart';
import 'package:bulka/modules/home/data/entity/home_product_entity.dart';
import 'package:bulka/core/shared/entity/slider_entity.dart';
import 'package:equatable/equatable.dart';

class HomeEntity extends Equatable {
  const HomeEntity({
    required this.sliders,
    required this.categories,
    required this.properties,
    required this.cars,
    required this.jobs,
    required this.importAndExport,
  });
  final List<CategoryTypeEntity> categories;
  final List<SliderEntity> sliders;
  final List<HomeProductEntity> properties;
  final List<HomeProductEntity> cars;
  final List<HomeProductEntity> jobs;
  final List<HomeProductEntity> importAndExport;

  @override
  List<Object?> get props =>
      [categories, sliders, properties, cars, jobs, importAndExport];
}
