import 'package:bulka/core/utils/enums/enums.dart';
import 'package:equatable/equatable.dart';

class MyProfileInfoEntity extends Equatable {
  const MyProfileInfoEntity({
    required this.id,
    required this.fullName,
    required this.userType,
    required this.email,
    required this.phoneCode,
    required this.phone,
    required this.isActive,
    required this.isBan,
    required this.isNotified,
    required this.avatar,
    required this.companyData,
    this.unreadNotifications,
  });
  final int id;
  final String fullName;
  final UserType userType;
  final String email;
  final String? avatar;
  final String phoneCode;
  final String phone;
  final bool isActive;
  final bool isBan;
  final bool isNotified;
  final int? unreadNotifications;

  final CompanyDataEntity? companyData;

  @override
  List<Object?> get props => [
        id,
        fullName,
        userType,
        email,
        avatar,
        phoneCode,
        phone,
        isActive,
        isBan,
        isNotified,
        companyData,
        unreadNotifications,
      ];
}

class CompanyDataEntity extends Equatable {
  const CompanyDataEntity({
    required this.id,
    required this.companySize,
    required this.description,
    required this.name,
    required this.websiteUrl,
  });
  final int id;
  final CompanySize? companySize;
  final String description;
  final String name;
  final String websiteUrl;

  @override
  List<Object?> get props =>
      [id, companySize, name, description, name, websiteUrl];
}
