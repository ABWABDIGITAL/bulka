class ApiConstance {
  static const String baseUrl =
      'https://bulka.thesoftwarecompany.io/public/api/v1';
//------------------------------AUTHENTICATION--------------------------------//
  static const String login = '/app/login';
  static const String countries = '/app/helpers/countries';
  static const String userRegister = '/app/client/register';
  static const String companyRegister = '/public/auth/companyRegister';
  static const String verifyAccount = '/public/auth/verify';
  static const String forgotPasswordWithEmail =
      '/public/auth/forgotPasswordWithEmail';
  static const String forgotPasswordWithPhone =
      '/public/auth/forgotPasswordWithPhone';
  static const String verifyForgotPasswordCode =
      '/public/auth/verifyForgotPasswordCode';
//---------------------------------INTERESTS----------------------------------//
  static const String interests = '/public/auth/interests';
}
