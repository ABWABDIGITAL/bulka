import 'package:bulka/core/services/servies_locator/service_locator.dart';
import 'package:bulka/modules/company_register/data/repo/company_register_repo.dart';
import 'package:bulka/modules/forgot_password/data/repo/forgot_password_repo.dart';
import 'package:bulka/modules/login/data/repo/login_repo.dart';
import 'package:bulka/modules/user_register/data/repo/user_register_repo.dart';
import 'package:bulka/modules/verify_account/data/repo/verify_account_repo.dart';

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
  sl.registerLazySingleton<VerifyAccountRepo>(() => const VerifyAccountRepo());
//-------------------------------FORGOT PASSWORD-------*----------------------//
  //REPOSITORIES
  sl.registerLazySingleton<ForgotPasswordRepo>(
      () => const ForgotPasswordRepo());
}
