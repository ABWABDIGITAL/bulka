import 'package:bulka/core/utils/enums/enums.dart';
import 'package:equatable/equatable.dart';

class SliderEntity extends Equatable {
  const SliderEntity({
    required this.id,
    required this.link,
    required this.type,
    required this.image,
  });
  final int id;
  final String? link;
  final SliderTypes? type;
  final String image;

  @override
  List<Object?> get props => [id, link, type, image];
}
