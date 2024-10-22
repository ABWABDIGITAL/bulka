import 'package:dio/dio.dart';

class VerifyIdParams {
  VerifyIdParams({
    required this.id,
  });

  final MultipartFile id;

  

  Map<String, dynamic> toMap() => {
        "id_photo": id,
      };
}