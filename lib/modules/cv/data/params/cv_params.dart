import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

class CvParams extends Equatable {
  final MultipartFile cvFile;

  const CvParams({required this.cvFile});

  Map<String, dynamic> toMap() {
    return {'cv': cvFile};
  }

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
