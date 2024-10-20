import 'package:bulka/core/services/ad_details/data/params/ad_details_params.dart';
import 'package:bulka/core/services/sub_subcategory/data/params/sub_subcategory_params.dart';
import 'package:bulka/core/services/subcategory/data/params/subcategory_params.dart';
import 'package:bulka/modules/favourites/data/params/toggle_favourite_params.dart';
import 'package:bulka/modules/notifications/data/params/notification_details_params.dart';
import 'package:bulka/modules/posts/data/params/post_details_params.dart';
import 'package:bulka/modules/posts/data/params/post_save_params.dart';
import 'package:bulka/modules/posts/data/params/post_share_params.dart';
import 'package:bulka/modules/posts_comments/data/params/post_comments_params.dart';

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
  static String postComments(PostCommentsParams params) =>
      '/app/posts/comment/${params.postId}';
  static const String sendComment = '/app/posts/comment';
  static String savePost(PostSaveParams params) =>
      '/app/posts/save/${params.adId}';
  static String postDetails(PostDetailsParams params) =>
      '/app/posts/show/${params.adId}';
  static const String reactOnPost = '/app/posts/react';
  static String postShare(PostShareParams params) =>
      '/app/posts/share/${params.adId}';
//--------------------------------NOTIFICATIONS----------------------------------//
  static const String allNotifications = '/app/notifications';
  static String notificationDetails(NotificationDetailsParams params) =>
      '/app/notifications/${params.notificationId}';

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
  //-------------------------------OFFERS------------------------------------//
  static const String offersBanner = '/app/profile/offer-banners';
  static const String offers = '/app/profile/offers';
  //-------------------------------CERTIFICATION------------------------------------//
  static const String certification = '/app/cv/certificate';
  //-------------------------------CV------------------------------------//
  static const String uploadCv = '/app/cv/cv/upload';
  //---------------------------------SKILLS-----------------------------------------//
  static const String userSkills = '/app/cv/skill';
  static const String skills = '/app/helpers/skills';
  static const String deleteSkills = '/app/cv/skill/remove';
  //---------------------------------CHANGE PASSWORD-----------------------------------------//
  static const String changePassword = '/app/profile/edit-password';
  //---------------------------------FAQ-----------------------------------------//
  static const String faq = '/app/faq';
  //---------------------------------LOGOUT------------------------------------//
  static const String logout = '/app/logout';
}
