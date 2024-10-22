import 'package:bulka/core/services/profile_info/data/entity/my_profile_info_entity.dart';
import 'package:bulka/core/utils/enums/enum_switch_return.dart';

class MyProfileInfoModel extends MyProfileInfoEntity {
  const MyProfileInfoModel({
    required super.id,
    required super.fullName,
    required super.userType,
    required super.email,
    required super.phoneCode,
    required super.phone,
    required super.isActive,
    required super.isBan,
    required super.isNotified,
    required super.avatar,
    required super.companyData,
    required super.unreadNotifications,
  });

  factory MyProfileInfoModel.fromJson(Map<String, dynamic> json) {
    return MyProfileInfoModel(
      id: json['id'],
      fullName: json['full_name'],
      userType: EnumSwitchReturn.getUserType(json['user_type']),
      email: json['email'],
      phoneCode: json['phone_code'],
      phone: json['phone'],
      isActive: json['is_active'],
      isBan: json['is_ban'],
      isNotified: json['is_notified'],
      avatar: json['avatar'],
      companyData: json['company_data'] != null
          ? CompanyDataModel.fromJson(json['company_data'])
          : null,
      unreadNotifications: json['unread_notifications'],
    );
  }
  static Map<String, dynamic> toJson(MyProfileInfoEntity info) {
    return {
      "id": info.id,
      "full_name": info.fullName,
      "user_type": info.userType.name,
      "email": info.email,
      "phone_code": info.phoneCode,
      "phone": info.phone,
      "is_active": info.isActive,
      "is_ban": info.isBan,
      "is_notified": info.isNotified,
      "avatar": info.avatar,
      'company_data': info.companyData != null
          ? CompanyDataModel.toJson(info.companyData)
          : null,
    };
  }
}

class CompanyDataModel extends CompanyDataEntity {
  const CompanyDataModel({
    required super.id,
    required super.description,
    required super.name,
    required super.websiteUrl,
    required super.companySize,
  });

  factory CompanyDataModel.fromJson(Map<String, dynamic> json) {
    return CompanyDataModel(
      id: json['id'],
      companySize: EnumSwitchReturn.getCompanySize(json['company_size']),
      description: json['description'],
      name: json['name'],
      websiteUrl: json['website_url'],
    );
  }

  static Map<String, dynamic> toJson(CompanyDataEntity? companyData) {
    return {
      'id': companyData?.id,
      'description': companyData?.description,
      'name': companyData?.name,
      'website_url': companyData?.websiteUrl,
      'company_size': companyData?.companySize?.name,
    };
  }
}
