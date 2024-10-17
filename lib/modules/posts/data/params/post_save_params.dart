import 'package:equatable/equatable.dart';

class PostSaveParams extends Equatable {
  const PostSaveParams({required this.adId});
  final int adId;

  @override
  List<Object?> get props => [adId];
}
