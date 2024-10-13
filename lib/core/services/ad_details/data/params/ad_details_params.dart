import 'package:equatable/equatable.dart';

class AdDetailsParams extends Equatable {
  const AdDetailsParams({required this.id});
  final int id;

  @override
  List<Object?> get props => [id];
}
