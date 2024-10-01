import 'dart:convert';

import 'package:bulka/core/assets/asset_translations.dart';
import 'package:bulka/core/services/cache/shared_pref.dart';
import 'package:bulka/core/services/profile_info/data/entity/my_profile_info_entity.dart';
import 'package:bulka/core/services/profile_info/data/model/my_profile_info_model.dart';
import 'package:bulka/core/shared/entity/token_entity.dart';
import 'package:bulka/core/shared/models/token_model.dart';
import 'package:bulka/core/utils/constant/shared_pref_keys.dart';
import 'package:bulka/core/utils/constant/strings.dart';
import 'package:bulka/core/utils/widgets/responsive/responsive.dart';
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
  if (textLanguages is Map<String, dynamic>) {
    return textLanguages[currentLanguage?.locale.languageCode] ??
        textLanguages['en'] ??
        'field is null';
  } else {
    return textLanguages;
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
