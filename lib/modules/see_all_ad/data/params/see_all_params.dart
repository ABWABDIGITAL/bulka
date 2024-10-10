import 'package:bulka/core/utils/enums/enums.dart';
import 'package:equatable/equatable.dart';

class SeeAllParams extends Equatable {
  const SeeAllParams({required this.adType});
  final AdType adType;

  Map<String, dynamic> returnedMap() {
    Map<String, dynamic> map = {"ad_type": adType.name};
    map.removeWhere((key, value) => value == null);
    return map;
  }

  @override
  List<Object?> get props => [adType];
}
