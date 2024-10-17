import 'package:dio/dio.dart';

class EditProfileParams {
  final String? fullName;
  final MultipartFile? avatar;

  EditProfileParams({
     this.fullName,
     this.avatar,
  });

  Map<String,dynamic> toMap() {
    Map<String,dynamic> map = {
      'full_name': fullName,
      'avatar': avatar,
    };
     map.removeWhere((key, value) => value == null);
    return map;
  }

}