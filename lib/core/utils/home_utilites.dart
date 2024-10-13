import 'dart:convert';
import 'package:bulka/core/services/ad_details/data/params/ad_details_params.dart';
import 'package:bulka/core/services/cache/shared_pref.dart';
import 'package:bulka/core/shared/entity/product_entities/product_main_information_entity.dart';
import 'package:bulka/core/shared/entity/token_entity.dart';
import 'package:bulka/core/shared/models/token_model.dart';
import 'package:bulka/core/shared/widgets/post_card_widget.dart';
import 'package:bulka/core/shared/widgets/product_details_cards/car_card_widget.dart';
import 'package:bulka/core/shared/widgets/product_details_cards/jop_card_widget.dart';
import 'package:bulka/core/shared/widgets/product_details_cards/properties_card_widget.dart';
import 'package:bulka/core/utils/constant/shared_pref_keys.dart';
import 'package:bulka/core/utils/constant/strings.dart';
import 'package:bulka/core/utils/enums/enums.dart';
import 'package:bulka/core/utils/extensions/extensions.dart';
import 'package:bulka/core/utils/widgets/responsive/responsive.dart';
import 'package:bulka/modules/ad_details_modules/car_product_details/ui/views/car_product_details_screen.dart';
import 'package:bulka/modules/ad_details_modules/jop_details/ui/views/jop_details_screen.dart';
import 'package:bulka/modules/ad_details_modules/post_details/ui/views/post_details_screen.dart';
import 'package:bulka/modules/ad_details_modules/properity_product_details/ui/views/properity_product_details_screen.dart';
import 'package:bulka/modules/posts/data/entity/post_details_entity.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

bool checkFromArray(dynamic myArray) {
  if (myArray != null && myArray is List && myArray.isNotEmpty) {
    return true;
  } else {
    return false;
  }
}

bool checkFromMap(dynamic myMap) {
  if (myMap != null &&
      (myMap is Map || myMap is Map<String, dynamic>) &&
      myMap.isNotEmpty) {
    return true;
  } else {
    return false;
  }
}

Future<void> saveToken(TokenEntity tokenEntity) async {
  try {
    await SharedPrefHelper.setSecuredString(
        SharedPrefKeys.userToken, jsonEncode(tokenEntity.toJson()));
    await getToken();
  } catch (e) {
    debugPrint(e.toString());
  }
}

Future<TokenEntity?> getToken() async {
  try {
    final String? userToken =
        await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
    token =
        userToken != null ? TokenModel.fromJson(jsonDecode(userToken)) : null;
    return token;
  } catch (e) {
    debugPrint(e.toString());
  }
  return null;
}

bool isScreenSmallFun(BuildContext context) {
  if (Responsive.isSmall(context) || Responsive.isMedium(context)) {
    return isScreenSmall = true;
  } else {
    return isScreenSmall = true;
  }
}

String getSuitableImageForScreen(final Map<String, dynamic> photos) {
  if (isScreenSmall) {
    return photos['sm'];
  } else {
    return photos['lg'];
  }
}

Future<bool> clearAllDataToLogout() async {
  try {
    await SharedPrefHelper.clearAllSecuredData();
    return true;
  } catch (e) {
    debugPrint(e.toString());
  }
  return false;
}

String getSuitableNameLanguageForScreen(final dynamic textLanguages) {
  if (textLanguages == null) return "field is null";

  if (textLanguages is List) {
    return textLanguages[0] ?? "field is null";
  }

  if (textLanguages is Map<String, dynamic>) {
    return textLanguages['en'] is List
        ? textLanguages['en'][0]
        : textLanguages['en'].toString();
  } else {
    return textLanguages.toString();
  }
}

Future<Position?> getCurrentPosition() async {
  // Check if location services are enabled
  bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled, return an error or request to enable it
    return null;
    // throw Exception('Location services are disabled.');
  }

  // Check location permission
  LocationPermission permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    // Request permission if it hasn't been granted
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return null;
      // Permissions are denied, return an error or handle it accordingly
      // throw Exception('Location permissions are denied.');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return null;
    // Permissions are denied forever, return an error or prompt user to enable it
    // throw Exception(
    //     'Location permissions are permanently denied, we cannot request permissions.');
  }

  // If all permissions are granted, get the current position
  Position position = await Geolocator.getCurrentPosition(
    desiredAccuracy: LocationAccuracy.high,
  );

  return position;
}

dynamic goToSuitableProductDetails({
  required ProductMainInformationEntity mainInfo,
  required BuildContext context,
}) {
  switch (mainInfo.adType) {
    case ProductCardWidgetDisplay.cars:
      return context.push(
          CarProductDetailsScreen(params: AdDetailsParams(id: mainInfo.id)));
    case ProductCardWidgetDisplay.jobs:
      return context.push(const JopDetailsScreen());
    case ProductCardWidgetDisplay.properties:
      return context.push(const ProperityProductDetailsScreen());
    case ProductCardWidgetDisplay.posts:
      return context.push(const PostDetailsScreen());
    default:
      return context.push(const ProperityProductDetailsScreen());
  }
}

Widget getSuitableProductDetailsByType({
  required ProductMainInformationEntity mainInfo,
  required BuildContext context,
  PostDetailsEntity? postDetailsEntity,
}) {
  switch (mainInfo.adType) {
    case ProductCardWidgetDisplay.cars:
      return CarCardWidget(info: mainInfo);
    case ProductCardWidgetDisplay.jobs:
      return JopCardWidget(info: mainInfo);
    case ProductCardWidgetDisplay.properties:
      return PropertiesCardWidget(info: mainInfo);
    case ProductCardWidgetDisplay.posts:
      if (postDetailsEntity == null) {
        return const Text(
          'provide us with post details entity please',
        );
      }
      return PostCardWidget(post: postDetailsEntity);
    default:
      return const Text('unkown ad type');
  }
}
