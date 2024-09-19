import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/modules/authentication/verify_account/data/params/verify_account_with_phone_params.dart';
import 'package:easy_localization/easy_localization.dart';

abstract class AccountVerification {
  late String title;
  late String description;
  late String imagePath;
  Future<void> sendVerificationCode(String email);
  Future<void> verifyCode(String email, String code);
}

class VerifyAccountWithEmail implements AccountVerification {
  @override
  Future<void> sendVerificationCode(String email) async {}

  @override
  Future<void> verifyCode(String email, String code) async {}

  @override
  String title = AppStrings.verifyYourEmail.tr();

  @override
  String description = AppStrings.checkYourEmailAndEnterVerification.tr();

  @override
  String imagePath = AssetIcons.verifyEmail;
}

class VerifyAccountWithPhone implements AccountVerification {
  @override
  Future<void> sendVerificationCode(String phone) async {}

  @override
  Future<void> verifyCode(String phone, String code) async {}
  @override
  String title = AppStrings.verifyYourPhone.tr();

  @override
  String description = AppStrings.checkYourPhoneAndEnterVerification.tr();
  @override
  String imagePath = AssetIcons.verifyEmail;

  // final VerifyAccountWithPhoneParams params;
}
