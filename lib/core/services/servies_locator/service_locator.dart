import 'package:bulka/core/services/servies_locator/modules/authentication_locator.dart';
import 'package:bulka/core/services/servies_locator/modules/init_locator.dart';
import 'package:bulka/core/services/servies_locator/modules/interests_locator.dart';
import 'package:bulka/core/services/servies_locator/modules/navbar_locator.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

class ServiceLocator {
  Future<void> init() async {
//-------------------------------INIT LOCATOR---------------------------------//
    initLocator();
//--------------------------AUTHENTICATION LOCATOR----------------------------//
    authenticationLocator();
//-----------------------------INTERSTS LOCATOR-------------------------------//
    interestsLocator();
//-------------------------------HOME LOCATOR---------------------------------//
    navbarLocator();
  }
}
