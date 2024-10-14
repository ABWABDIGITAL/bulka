import 'package:bulka/core/utils/enums/enums.dart';
import 'package:equatable/equatable.dart';

class ToggleFavouriteParams extends Equatable {
  const ToggleFavouriteParams({required this.adType, required this.adId});

  final AdType adType;
  final int adId;

  Map<String, dynamic> returnedMap() {
    Map<String, dynamic> map = {"ad_type": adType.name};
    map.removeWhere((key, value) => value == null);
    return map;
  }

  @override
  List<Object?> get props => [adType, adId];
}
