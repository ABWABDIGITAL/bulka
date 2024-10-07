import 'package:bulka/core/services/category_fields/data/params/category_field_params.dart';
import 'package:bulka/core/services/sub_subcategory/data/params/sub_subcategory_params.dart';
import 'package:bulka/core/services/subcategory/data/params/subcategory_params.dart';

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
//-----------------------------------PROFILE----------------------------------//
  static const String profile = '/app/profile';
//-------------------------------CATEGORY FIELDS------------------------------//
  static const String categoryFields = '/app/categories/category-fields';
//---------------------------------SUBCATEGORY----------------------------------//
  static String subcategory(SubcategoryParams params) =>
      '/app/categories/subcategory/${params.categoryId}';
//--------------------------------SUB SUBCATEGORY----------------------------------//
  static String subSubcategory(SubSubcategoryParams params) =>
      '/app/categories/sub-subcategory/${params.subcategoryId}';
//----------------------------------CREATE AD------------------------------------//
  static const String createAd = '/app/ad/store';
  static const String buyingAd = '/app/subscription/details';
}
