import 'package:equatable/equatable.dart';

class LoginParams extends Equatable {
  final String phone;
  final String password;
  final String email;
  final String deviceType;
  final String? deviceToken;
  final double? lat;
  final double? lng;
  final String? location;

  const LoginParams({
    required this.phone,
    required this.password,
    required this.email,
    required this.deviceToken,
    required this.deviceType,
    required this.lat,
    required this.lng,
    required this.location,
  });
  Map<String, dynamic> returnedMap() {
    Map<String, dynamic> map = {
      "phone": phone,
      "password": password,
      "email": email,
      "device_token": deviceToken,
      "device_type": deviceType,
      "lat": lat,
      "lng": lng,
      "location": location,
    };
    map.removeWhere((key, value) => value == null);
    return map;
  }

  @override
  List<Object?> get props => [
        phone,
        password,
        email,
        deviceType,
        deviceToken,
        lat,
        lng,
        location,
      ];
}
