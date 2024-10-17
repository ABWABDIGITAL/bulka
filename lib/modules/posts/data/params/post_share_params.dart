import 'package:equatable/equatable.dart';

class PostShareParams extends Equatable {
  const PostShareParams({required this.adId});
  final int adId;

  @override
  List<Object?> get props => [adId];
}
