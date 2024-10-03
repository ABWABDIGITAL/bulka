import 'package:bulka/core/shared/entity/token_entity.dart';
import 'package:equatable/equatable.dart';

class VerifyPhoneEntity extends Equatable {
  const VerifyPhoneEntity({
    required this.message,
    required this.token,
  });
  final String message;
  final TokenEntity token;
  @override
  List<Object?> get props => [message, token];
}
