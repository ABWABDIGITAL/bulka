import 'package:bulka/core/utils/enums/enum_switch_return.dart';
import 'package:bulka/core/shared/entity/slider_entity.dart';

class SliderModel extends SliderEntity {
  const SliderModel({
    required super.id,
    required super.link,
    required super.type,
    required super.image,
  });

  factory SliderModel.fromJson(Map<String, dynamic> json) {
    return SliderModel(
      id: json['id'],
      link: json['link'],
      type: EnumSwitchReturn.getSliderType(json['type']),
      image: json['image'],
    );
  }
}
