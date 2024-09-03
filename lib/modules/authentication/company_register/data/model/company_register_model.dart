import 'package:bulka/modules/authentication/company_register/data/entity/company_reigster_entity.dart';

class CompanyRegisterModel extends CompanyRegisterEntity {
  const CompanyRegisterModel({required super.message});

  factory CompanyRegisterModel.fromJson(Map<String, dynamic> json) {
    return CompanyRegisterModel(message: json['message']);
  }
}
