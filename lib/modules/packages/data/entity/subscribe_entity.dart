import 'package:bulka/core/utils/enums/enums.dart';
import 'package:bulka/modules/packages/data/entity/packages_entity.dart';
import 'package:equatable/equatable.dart';

class SubscribeEntity extends Equatable {
  const SubscribeEntity({
    required this.message,
    required this.subscribeId,
    required this.packages,
    required this.status,
    required this.expiresAt,
  });
  final String message;
  final int subscribeId;
  final PackagesEntity packages;
  final SubscribtionStatusTypes status;
  final String expiresAt;

  @override
  List<Object?> get props =>
      [message, subscribeId, packages, status, expiresAt];
}
