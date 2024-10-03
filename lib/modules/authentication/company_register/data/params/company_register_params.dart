import 'dart:io';

import 'package:bulka/core/utils/constant/strings.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

class CompanyRegisterParams extends Equatable {
  const CompanyRegisterParams({
    required this.fullName,
    required this.phone,
    required this.phoneCode,
    required this.email,
    required this.categoryId,
    required this.description,
    required this.password,
    required this.comfirmPassword,
    required this.websiteUrl,
    required this.companySize,
    required this.countryId,
    required this.additionalWebsiteUrl,
    required this.companyLogo,
  });

  final String fullName;
  final String phone;
  final String phoneCode;
  final String email;
  final String categoryId;
  final String description;
  final String password;
  final String comfirmPassword;
  final String websiteUrl;
  final String? additionalWebsiteUrl;
  final String companySize;
  final String countryId;
  final File? companyLogo;
  Future<Map<String, dynamic>> returnedMap() async {
    final logo = companyLogo != null
        ? await MultipartFile.fromFile(companyLogo!.path)
        : null;
    Map<String, dynamic> map = {
      'full_name': fullName,
      'phone': phone,
      'phone_code': phoneCode,
      'email': email,
      'category_id': categoryId,
      'description': description,
      'password': password,
      'website_url': websiteUrl,
      'additional_connection': additionalWebsiteUrl,
      "is_agree": 1,
      'company_size': companySize,
      'country_id': countryId,
      'locale': currentLanguage!.locale.languageCode,
      "avatar": logo,
    };
    map.removeWhere((key, value) => value == null);
    return map;
  }

  @override
  List<Object?> get props => [
        fullName,
        phone,
        phoneCode,
        email,
        categoryId,
        description,
        password,
        comfirmPassword,
        websiteUrl,
        additionalWebsiteUrl,
        companySize,
        countryId
      ];
}
