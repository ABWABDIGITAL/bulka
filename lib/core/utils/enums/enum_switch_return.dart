import 'package:bulka/core/utils/enums/enums.dart';

//IMPLEMENTATION FOR ENUMS FILE
class EnumSwitchReturn {
  UserRole getUserRole(String status) {
    switch (status) {
      case 'user':
        return UserRole.user;
      case 'company':
        return UserRole.company;
      default:
        return UserRole.unkown;
    }
  }
}
