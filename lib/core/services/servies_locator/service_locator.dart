import 'package:bulka/core/services/servies_locator/modules/authentication_locator.dart';
import 'package:bulka/core/services/servies_locator/modules/category_field_locator.dart';
import 'package:bulka/core/services/servies_locator/modules/category_locator.dart';
import 'package:bulka/core/services/servies_locator/modules/chat_locator.dart';
import 'package:bulka/core/services/servies_locator/modules/country_locator.dart';
import 'package:bulka/core/services/servies_locator/modules/create_ad_locator.dart';
import 'package:bulka/core/services/servies_locator/modules/home_locator.dart';
import 'package:bulka/core/services/servies_locator/modules/init_locator.dart';
import 'package:bulka/core/services/servies_locator/modules/interests_locator.dart';
import 'package:bulka/core/services/servies_locator/modules/navbar_locator.dart';
import 'package:bulka/core/services/servies_locator/modules/profile_locator.dart';
import 'package:bulka/core/services/servies_locator/modules/sub_subcategory_locator.dart';
import 'package:bulka/core/services/servies_locator/modules/subcategory_locator.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

class ServiceLocator {
  Future<void> init() async {
//-------------------------------INIT LOCATOR---------------------------------//
    await initLocator();
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
//-----------------------------CATEGORY FIELDS----------------------------------//
    categoryFieldLocator();
//-------------------------------SUBCATEGORIES---------------------------------//
    subcategoryLocator();
//-----------------------------SUB SUBCATEGORIES--------------------------------//
    subSubcategoryLocator();
//----------------------------------HOME--------------------------------------//
    homeLocator();
//---------------------------------PROFILE--------------------------------------//
    profileLocator();
//--------------------------------CREATE AD------------------------------------//
    createAdLocator();
  }
}
