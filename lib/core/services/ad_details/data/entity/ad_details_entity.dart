import 'package:bulka/core/shared/entity/product_entities/ad_category_field_entity.dart';
import 'package:bulka/core/shared/entity/product_entities/ad_media_entity.dart';
import 'package:bulka/core/shared/entity/product_entities/product_main_information_entity.dart';
import 'package:equatable/equatable.dart';

class AdDetailsEntity extends Equatable {
  final int id;
  const AdDetailsEntity({required this.id});

  @override
  List<Object?> get props => [id];
}
