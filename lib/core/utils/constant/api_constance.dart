import 'package:bulka/core/services/ad_details/data/params/ad_details_params.dart';
import 'package:bulka/core/services/sub_subcategory/data/params/sub_subcategory_params.dart';
import 'package:bulka/core/services/subcategory/data/params/subcategory_params.dart';
import 'package:bulka/modules/favourites/data/params/toggle_favourite_params.dart';

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
  static const String categoriesProducts = '/app/ads/search';
//---------------------------------FAVOURITE----------------------------------//
  static String toggleFavourite(ToggleFavouriteParams params) =>
      '/app/fav-ad/${params.adId}';
//---------------------------------INTERESTS----------------------------------//
  static const String interests = '/app/helpers/interests';
  static const String updateInterests = '/app/update-interests';
//-----------------------------------HOME----------------------------------//
  static const String home = '/app/home';
  static const String seeAllAds = '/app/ads-by-type';
  static const String search = '/app/ads/search';
  static const String searchHistory = '/app/ads/search-history';
//------------------------------------POSTS----------------------------------//
  static const String posts = '/app/posts';
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
//----------------------------------PACKAGES------------------------------------//
  static const String getPackages = '/app/subscription/packages';
  static const String getSubscribtions = '/app/subscription';
  static const String subscribe = '/app/subscription/store';
  static const String paySubscribtion = '/app/subscription/confirm-payment';
//----------------------------------Ad Details------------------------------------//
  static String adDetails(AdDetailsParams params) => '/app/ad/${params.id}';
  //-------------------------------WORK EXPERIENCE--------------------------------//
  static const String jobTitles = '/app/helpers/job-titles';
  static const String workExperience = '/app/cv/work-experience';
  //-------------------------------EDUCATION--------------------------------//
  static const String educationDegree = '/app/helpers/education-degrees';
  static const String education = '/app/cv/education';
  static const String educationUniversity = '/app/helpers/universities';
  //-------------------------------CERTIFICATION------------------------------------//
  static const String certification = '/app/cv/certificate';
  //-------------------------------CV------------------------------------//
  static const String uploadCv = '/app/cv/cv/upload';
  //---------------------------------SKILLS-----------------------------------------//
  static const String skills = '/app/cv/skill';
  //---------------------------------LOGOUT------------------------------------//
  static const String logout = '/app/logout';
}
