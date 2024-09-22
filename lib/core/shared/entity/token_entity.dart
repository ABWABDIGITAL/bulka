import 'package:equatable/equatable.dart';

class TokenEntity extends Equatable {
  const TokenEntity({required this.token});
  final String token;

  Map<String, dynamic> toJson() {
    return {"token": token};
  }

  @override
  List<Object?> get props => [token];
}
