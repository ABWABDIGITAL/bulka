import 'package:bulka/core/services/servies_locator/modules/ad_details_locator.dart';
import 'package:bulka/core/services/servies_locator/modules/authentication_locator.dart';
import 'package:bulka/core/services/servies_locator/modules/category_field_locator.dart';
import 'package:bulka/core/services/servies_locator/modules/category_locator.dart';
import 'package:bulka/core/services/servies_locator/modules/category_products_locator.dart';
import 'package:bulka/core/services/servies_locator/modules/certification_locator.dart';
import 'package:bulka/core/services/servies_locator/modules/change_password_locator.dart';
import 'package:bulka/core/services/servies_locator/modules/chat_locator.dart';
import 'package:bulka/core/services/servies_locator/modules/country_locator.dart';
import 'package:bulka/core/services/servies_locator/modules/create_ad_locator.dart';
import 'package:bulka/core/services/servies_locator/modules/cv_locator.dart';
import 'package:bulka/core/services/servies_locator/modules/edit_profile_locator.dart';
import 'package:bulka/core/services/servies_locator/modules/education_locator.dart';
import 'package:bulka/core/services/servies_locator/modules/faq_locator.dart';
import 'package:bulka/core/services/servies_locator/modules/home_locator.dart';
import 'package:bulka/core/services/servies_locator/modules/interests_locator.dart';
import 'package:bulka/core/services/servies_locator/modules/logout_locator.dart';
import 'package:bulka/core/services/servies_locator/modules/navbar_locator.dart';
import 'package:bulka/core/services/servies_locator/modules/notifications_locator.dart';
import 'package:bulka/core/services/servies_locator/modules/offers_locator.dart';
import 'package:bulka/core/services/servies_locator/modules/packages_locator.dart';
import 'package:bulka/core/services/servies_locator/modules/posts_locator.dart';
import 'package:bulka/core/services/servies_locator/modules/profile_locator.dart';
import 'package:bulka/core/services/servies_locator/modules/search_locator.dart';
import 'package:bulka/core/services/servies_locator/modules/see_all_locator.dart';
import 'package:bulka/core/services/servies_locator/modules/settings_locator.dart';
import 'package:bulka/core/services/servies_locator/modules/skills_locator.dart';
import 'package:bulka/core/services/servies_locator/modules/sub_subcategory_locator.dart';
import 'package:bulka/core/services/servies_locator/modules/subcategory_locator.dart';
import 'package:bulka/core/services/servies_locator/modules/user_language_locator.dart';
import 'package:bulka/core/services/servies_locator/modules/work_experience_locator.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

class ServiceLocator {
  Future<void> init() async {
// //-------------------------------INIT LOCATOR---------------------------------//
//     await initLocator();
//--------------------------AUTHENTICATION LOCATOR----------------------------//
    authenticationLocator();
//-----------------------------INTERSTS LOCATOR-------------------------------//
    interestsLocator();
//-------------------------------HOME LOCATOR---------------------------------//
    navbarLocator();
//----------------------------------CHAT--------------------------------------//
    chatLocator();
//--------------------------------COUNTRIES--------------------------------------//
    countryLocator();
//-------------------------------CATEGORIES--------------------------------------//
    categoryLocator();
    categoryProductsLocator();
//-----------------------------CATEGORY FIELDS----------------------------------//
    categoryFieldLocator();
//-------------------------------SUBCATEGORIES---------------------------------//
    subcategoryLocator();
//-----------------------------SUB SUBCATEGORIES--------------------------------//
    subSubcategoryLocator();
//----------------------------------HOME--------------------------------------//
    homeLocator();
//----------------------------------POSTS--------------------------------------//
    postsLocator();
//---------------------------------PROFILE--------------------------------------//
    profileLocator();
//------------------------------------AD------------------------------------//
    createAdLocator();
    adDetailsLocator();
//----------------------------------SEARCH------------------------------------//
    searchLocator();
//----------------------------------SEE ALL------------------------------------//
    seeAllLocator();
//----------------------------------LOGOUT------------------------------------//
    logoutLocator();
//--------------------------------SETTINGS------------------------------------//
    settingsLocator();
//--------------------------------PACKAGES------------------------------------//
    packagesLocator();
//--------------------------------EDIT PROFILE------------------------------------//
    editProfileLocator();
//--------------------------------WORK EXPERIENCE------------------------------------//
    workExperienceLocator();
//--------------------------------EDUCATION------------------------------------//
    educationLocator();
//--------------------------------CERTIFICATION------------------------------------//
    certificationLocator();
//--------------------------------CV------------------------------------//
    cvLocator();
//--------------------------------SKILLS------------------------------------//
    skillsLocator();
//--------------------------------OFFERS------------------------------------//
    offersLocator();
//--------------------------------CHANGE PASSWORD------------------------------------//
    changePasswordLocator();
//--------------------------------FAQ------------------------------------//
    faqLocator();
//-------------------------------NOTIFCAITONS------------------------------------//
    notificationsLocator();
    //--------------------------------FAQ------------------------------------//
    faqLocator();
    //--------------------------------USER LANGUAGE------------------------------------//
    userLanguageLocator();
  }
}
