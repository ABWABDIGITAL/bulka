import 'package:bulka/core/shared/widgets/like_animated_react_widget.dart';
import 'package:equatable/equatable.dart';

class PostReactParams extends Equatable {
  const PostReactParams({
    required this.adId,
    required this.react,
  });
  final int adId;
  final Reaction react;

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
