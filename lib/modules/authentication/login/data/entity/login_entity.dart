import 'package:bulka/core/services/profile_info/data/entity/my_profile_info_entity.dart';
import 'package:bulka/core/shared/entity/token_entity.dart';
import 'package:equatable/equatable.dart';

class LoginEntity extends Equatable {
  final String message;
  final TokenEntity tokenEntity;
  final MyProfileInfoEntity myProfileInfoEntity;
  const LoginEntity({
    required this.message,
    required this.tokenEntity,
    required this.myProfileInfoEntity,
  });

  @override
  List<Object?> get props => [message, tokenEntity, myProfileInfoEntity];
}
