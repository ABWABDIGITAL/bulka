import 'package:equatable/equatable.dart';

class LoginLocationParams extends Equatable {
  const LoginLocationParams({
    this.location,
    this.lat,
    this.lng,
  });

  final String? location;
  final double? lat;
  final double? lng;

  @override
  List<Object?> get props => [location, lat, lng];
}
