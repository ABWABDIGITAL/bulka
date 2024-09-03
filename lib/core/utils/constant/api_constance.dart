class ApiConstance {
  static const String baseUrl = 'https://api.ABWAB.com/v1';
//------------------------------AUTHENTICATION--------------------------------//
  static const String login = '/public/auth/login';
  static const String companyRegister = '/public/auth/companyRegister';
  static const String userRegister = '/public/auth/userRegister';
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
