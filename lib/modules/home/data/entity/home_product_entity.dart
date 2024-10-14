import 'package:bulka/core/shared/entity/product_entities/ad_category_field_entity.dart';
import 'package:bulka/core/shared/entity/product_entities/ad_media_entity.dart';
import 'package:bulka/core/shared/entity/product_entities/product_main_information_entity.dart';
import 'package:equatable/equatable.dart';

class HomeProductEntity extends Equatable {
  const HomeProductEntity({
    required this.mainInformation,
    required this.adMedia,
    required this.adCategoryField,
  });
  final ProductMainInformationEntity mainInformation;
  final List<AdMediaEntity> adMedia;
  final List<AdCategoryFieldEntity> adCategoryField;

  @override
  List<Object?> get props => [mainInformation, adMedia, adCategoryField];
}
