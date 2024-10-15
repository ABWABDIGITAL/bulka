import 'package:equatable/equatable.dart';

class LogoutParams extends Equatable {
  final String? deviceToken;
  final String type;

  const LogoutParams({required this.deviceToken, required this.type});
  Map<String, dynamic> toMap() {
    return {'device_token': deviceToken, 'type': type};
  }

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
