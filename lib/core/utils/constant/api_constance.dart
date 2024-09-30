class ApiConstance {
  static const String baseUrl =
      'https://bulka.thesoftwarecompany.io/public/api/v1';
//------------------------------AUTHENTICATION--------------------------------//
  static const String login = '/app/login';
  static const String countries = '/app/helpers/countries';
  static const String userRegister = '/app/client/register';
  static const String companyRegister = '/app/company/register';
  static const String verifyAccount = '/public/auth/verify';
  static const String verifyWithPhone = '/app/verify';
  static const String resendVerifyWithPhone = '/app/send-code';
  static const String forgotPasswordWithEmail = '/app/check-code';
  static const String forgotPasswordWithPhone = '/app/check-code';
  static const String resetPassword = '/app/reset-password';
//---------------------------------CATEGORY----------------------------------//
  static const String categories = '/app/categories';
//---------------------------------INTERESTS----------------------------------//
  static const String interests = '/app/helpers/interests';
  static const String updateInterests = '/app/update-interests';
//-----------------------------------HOME----------------------------------//
  static const String home = '/app/home';
}
