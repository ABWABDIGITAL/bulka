import 'package:dio/dio.dart';

class EditProfileParams {
  final String fullName;
  final MultipartFile avatar;

  EditProfileParams({
    required this.fullName,
    required this.avatar,
  });

  Map<String,dynamic> toMap() {
    return {
      'full_name': fullName,
      'avatar': avatar,
    };
  }

}