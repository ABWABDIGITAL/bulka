import 'package:bulka/core/services/ad_details/data/entity/ad_details_entity.dart';
import 'package:bulka/core/shared/entity/paggination_entity.dart';
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class SeeAllEntity extends Equatable {
  SeeAllEntity({
    required this.ads,
    required this.paggination,
  });
  List<AdDetailsEntity> ads;
  PagginationEntity paggination;

  @override
  List<Object?> get props => [ads, paggination];
}
