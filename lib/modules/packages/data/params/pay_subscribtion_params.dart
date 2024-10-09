import 'package:equatable/equatable.dart';

class PaySubscribtionParams extends Equatable {
  const PaySubscribtionParams({
    required this.subscribtionId,
    required this.transctionId,
  });
  final int subscribtionId;
  final dynamic transctionId;
  Map<String, dynamic> returnedMap() {
    Map<String, dynamic> map = {
      "transaction_id": transctionId,
      "subscription_id": subscribtionId,
    };
    map.removeWhere((key, value) => value == null);
    return map;
  }

  @override
  List<Object?> get props => [subscribtionId, transctionId];
}
