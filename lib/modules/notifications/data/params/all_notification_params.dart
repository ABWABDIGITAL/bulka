import 'package:equatable/equatable.dart';

class AllNotificationParams extends Equatable {
  const AllNotificationParams({
    required this.page,
  });

  final int page;

  Map<String, dynamic> returnedMap() {
    Map<String, dynamic> map = {"page": page};
    map.removeWhere((key, value) => value == null);
    return map;
  }

  @override
  List<Object?> get props => [page];
}
