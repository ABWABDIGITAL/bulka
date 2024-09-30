import 'package:bulka/core/utils/enums/enums.dart';
import 'package:equatable/equatable.dart';

class AdMediaEntity extends Equatable {
  const AdMediaEntity({
    required this.id,
    required this.media,
    required this.createdAt,
    required this.adMediaType,
  });
  final int id;
  final AdMediaType? adMediaType;
  final String media;
  final String createdAt;

  @override
  List<Object?> get props => [id, adMediaType, media, createdAt];
}
