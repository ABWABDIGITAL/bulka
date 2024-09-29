import 'package:bulka/core/shared/entity/token_entity.dart';
import 'package:equatable/equatable.dart';

class LoginEntity extends Equatable {
  final String message;
  final TokenEntity tokenEntity;
  const LoginEntity({
    required this.message,
    required this.tokenEntity,
  });

  @override
  List<Object?> get props => [message, tokenEntity];
}
