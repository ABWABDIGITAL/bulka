import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/modules/authentication/verify_forgot_password_code/data/entity/verify_forgot_password_entity.dart';
import 'package:easy_localization/easy_localization.dart';

class VerifyForgotPasswordModel extends VerifyForgotPasswordEntity {
  const VerifyForgotPasswordModel({
    required super.message,
    required super.isCodeCorrect,
  });

  factory VerifyForgotPasswordModel.fromJson(Map<String, dynamic> json) {
    return VerifyForgotPasswordModel(
      message: json['message'] ?? AppStrings.successfullOperation.tr(),
      isCodeCorrect: json['data']['is_code_correct'] ?? false,
    );
  }
}
