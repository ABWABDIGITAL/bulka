import 'package:bulka/core/services/servies_locator/service_locator.dart';
import 'package:bulka/modules/authentication/company_register/data/repo/company_register_repo.dart';
import 'package:bulka/modules/authentication/forgot_password/data/repo/forgot_password_repo.dart';
import 'package:bulka/modules/authentication/login/data/repo/login_repo.dart';
import 'package:bulka/modules/authentication/reset_password/data/repo/reset_password_repo.dart';
import 'package:bulka/modules/authentication/user_register/data/repo/user_register_repo.dart';
import 'package:bulka/modules/authentication/verify_phone/data/repo/verify_phone_repo.dart';
import 'package:bulka/modules/authentication/verify_forgot_password_code/data/repo/verify_forgot_password_repo.dart';

void authenticationLocator() {
//-----------------------------------LOGIN------------------------------------//
  // REPOSITORIES
  sl.registerLazySingleton<LoginRepo>(() => const LoginRepo());
//-------------------------------COMPANY REGISTER-------*----------------------//
  //REPOSITORIES
  sl.registerLazySingleton<CompanyRegisterRepo>(
      () => const CompanyRegisterRepo());
//-------------------------------USER REGISTER-------*----------------------//
  //REPOSITORIES
  sl.registerLazySingleton<UserRegisterRepo>(() => const UserRegisterRepo());
//-------------------------------VERIFY ACCOUNT-------*----------------------//
  //REPOSITORIES
  sl.registerLazySingleton<VerifyPhoneRepo>(() => const VerifyPhoneRepo());
//-------------------------------FORGOT PASSWORD-------*----------------------//
  //REPOSITORIES
  sl.registerLazySingleton<ForgotPasswordRepo>(
      () => const ForgotPasswordRepo());
//---------------------------VERIFY FORGOT PASSWORD-----------------------------//
  //REPOSITORIES
  sl.registerLazySingleton<VerifyForgotPasswordRepo>(
      () => const VerifyForgotPasswordRepo());
//-------------------------------RESET PASSWORD--------------------------------//
  //REPOSITORIES
  sl.registerLazySingleton<ResetPasswordRepo>(() => const ResetPasswordRepo());
}
