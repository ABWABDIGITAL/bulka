class ApiConstance {
  static const String baseUrl =
      'https://bulka.thesoftwarecompany.io/public/api/v1';
//------------------------------AUTHENTICATION--------------------------------//
  static const String login = '/app/login';
  static const String countries = '/app/helpers/countries';
  static const String userRegister = '/app/client/register';
  static const String companyRegister = '/public/auth/companyRegister';
  static const String verifyAccount = '/public/auth/verify';
  static const String verifyWithPhone = '/app/verify';
  static const String resendVerifyWithPhone = '/app/send-code';
  static const String forgotPasswordWithEmail = '/app/check-code';
  static const String forgotPasswordWithPhone = '/app/check-code';
//---------------------------------CATEGORY----------------------------------//
  static const String categories = '/app/helpers/categories';
//---------------------------------INTERESTS----------------------------------//
  static const String interests = '/public/auth/interests';
}
