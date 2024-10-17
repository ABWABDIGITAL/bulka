import 'package:equatable/equatable.dart';

class PostDetailsParams extends Equatable {
  const PostDetailsParams({required this.adId});
  final int adId;

  @override
  List<Object?> get props => [adId];
}
