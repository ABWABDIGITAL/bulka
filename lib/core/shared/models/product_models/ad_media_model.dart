import 'package:bulka/core/shared/entity/product_entities/ad_media_entity.dart';
import 'package:bulka/core/utils/enums/enum_switch_return.dart';

class AdMediaModel extends AdMediaEntity {
  const AdMediaModel({
    required super.id,
    required super.media,
    required super.createdAt,
    required super.adMediaType,
  });

  factory AdMediaModel.fromJson(Map<String, dynamic> json) {
    return AdMediaModel(
      id: json['id'],
      media: json['media'],
      createdAt: json['created_at'],
      adMediaType: EnumSwitchReturn.getAdMediaType(json['media_type']),
    );
  }
}
