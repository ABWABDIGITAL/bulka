import 'package:bulka/core/shared/entity/product_entities/ad_category_field_entity.dart';
import 'package:bulka/core/shared/entity/product_entities/ad_media_entity.dart';
import 'package:bulka/core/shared/entity/product_entities/product_main_information_entity.dart';
import 'package:equatable/equatable.dart';

class AdDetailsEntity extends Equatable {
  final ProductMainInformationEntity mainInfo;
  final List<AdMediaEntity> adMedia;
  final List<AdCategoryFieldEntity> adCategoryField;

  const AdDetailsEntity({
    required this.mainInfo,
    required this.adMedia,
    required this.adCategoryField,
  });

  @override
  List<Object?> get props => [mainInfo, adMedia, adCategoryField];
}
