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

  static ProductCardWidgetDisplay? getProductCardWidget(String? adType) {
    switch (adType) {
      case 'posts':
        return ProductCardWidgetDisplay.posts;
      case 'jobs':
        return ProductCardWidgetDisplay.jobs;
      case 'properties':
        return ProductCardWidgetDisplay.properties;
      case 'cars':
        return ProductCardWidgetDisplay.cars;
      case 'general':
        return ProductCardWidgetDisplay.general;
      case 'import_export':
        return ProductCardWidgetDisplay.import_and_export;
      default:
        return null;
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

  static SliderTypes? getSliderType(String? categoryType) {
    switch (categoryType) {
      case 'external':
        return SliderTypes.ex_ternal;
      case 'internal':
        return SliderTypes.internal;
      default:
        return null;
    }
  }

  static AdMediaType? getAdMediaType(String? adMediaType) {
    switch (adMediaType) {
      case 'image':
        return AdMediaType.image;
      default:
        return null;
    }
  }

  static UserType getUserType(String? userType) {
    switch (userType) {
      case 'company':
        return UserType.company;
      default:
        return UserType.unknown;
    }
  }

  static CompanySize? getCompanySize(String? companySize) {
    switch (companySize) {
      case 'large':
        return CompanySize.large;
      case 'medium':
        return CompanySize.medium;
      case 'small':
        return CompanySize.small;
      default:
        return null;
    }
  }

  static AdType getAdType(String? adType) {
    switch (adType) {
      case 'posts':
        return AdType.posts;
      case 'jobs':
        return AdType.jobs;
      case 'properties':
        return AdType.properties;
      case 'cars':
        return AdType.cars;
      case 'general':
        return AdType.general;
      case 'import_export':
        return AdType.import_export;
      default:
        return AdType.import_export;
    }
  }

  static CategoryFieldTypes getCategoryFieldTypes(String? fieldType) {
    switch (fieldType) {
      case 'text':
        return CategoryFieldTypes.text;
      case 'integer':
        return CategoryFieldTypes.integer;
      case 'check':
        return CategoryFieldTypes.check;
      case 'select':
        return CategoryFieldTypes.select;
      case 'boolean':
        return CategoryFieldTypes.boolean;

      default:
        return CategoryFieldTypes.text;
    }
  }

  static SubscribtionStatusTypes getSubscribtionStatusType(
      String? subscribtionStatus) {
    switch (subscribtionStatus) {
      case 'pending':
        return SubscribtionStatusTypes.pending;
      default:
        return SubscribtionStatusTypes.unkown;
    }
  }
}
