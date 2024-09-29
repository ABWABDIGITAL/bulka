import 'package:equatable/equatable.dart';

class LoginLocationParams extends Equatable {
  const LoginLocationParams({
    this.location,
    this.lat,
    this.lng,
  });

  final String? location;
  final String? lat;
  final String? lng;

  @override
  List<Object?> get props => [location, lat, lng];
}
