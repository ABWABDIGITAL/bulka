import 'package:equatable/equatable.dart';

class SubscribeParams extends Equatable {
  const SubscribeParams({required this.packageId});
  final int packageId;

  Map<String, dynamic> returnedMap() {
    Map<String, dynamic> map = {"package_id": packageId};
    map.removeWhere((key, value) => value == null);
    return map;
  }

  @override
  List<Object?> get props => [packageId];
}
