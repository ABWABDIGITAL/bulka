import 'package:bulka/core/utils/enums/enums.dart';

//IMPLEMENTATION FOR ENUMS FILE
class EnumSwitchReturn {
  UserRole getUserRole(String status) {
    switch (status) {
      case 'user':
        return UserRole.user;
      case 'company':
        return UserRole.company;
      case 'visitor':
        return UserRole.visitor;
      default:
        return UserRole.unkown;
    }
  }

  static CategoryTypes? getCategoryType(String? categoryType) {
    switch (categoryType) {
      case 'posts':
        return CategoryTypes.posts;
      case 'jobs':
        return CategoryTypes.jobs;
      case 'properties':
        return CategoryTypes.properties;
      case 'cars':
        return CategoryTypes.cars;
      case 'general':
        return CategoryTypes.general;
      case 'import_and_export':
        return CategoryTypes.import_and_export;
      default:
        return null;
    }
  }
}
