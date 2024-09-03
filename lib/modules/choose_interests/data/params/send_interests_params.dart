import 'package:bulka/modules/choose_interests/data/entity/interests_entity.dart';
import 'package:equatable/equatable.dart';

class SendInterestsParams extends Equatable {
  const SendInterestsParams({required this.choosenInterests});
  final List<InterestsEntity> choosenInterests;

  Map<String, dynamic> returnedMap() {
    Map<String, dynamic> map = {"choosenInterests": choosenInterests};
    map.removeWhere((key, value) => value == null);
    return map;
  }

  @override
  List<Object?> get props => [choosenInterests];
}
