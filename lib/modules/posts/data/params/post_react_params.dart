import 'package:bulka/core/utils/enums/enums.dart';
import 'package:equatable/equatable.dart';

class PostReactParams extends Equatable {
  const PostReactParams({
    required this.adId,
    required this.react,
  });
  final int adId;
  final ReactionTypes react;

  Map<String, dynamic> returnedMap() {
    Map<String, dynamic> map = {
      "ad_id": adId,
      "react_type": react.name,
    };
    map.removeWhere((key, value) => value == null);
    return map;
  }

  @override
  List<Object?> get props => [adId, react];
}
