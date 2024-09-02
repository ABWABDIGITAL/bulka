import 'package:bulka/core/services/cache/shared_pref.dart';
import 'package:bulka/core/utils/constant/strings.dart';
import 'package:bulka/core/utils/widgets/responsive/responsive.dart';
import 'package:flutter/material.dart';

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

// Future<void> saveToken(TokenEntity tokenEntity) async {
//   try {
//     await SharedPrefHelper.setSecuredString(
//         SharedPrefKeys.userToken, tokenEntity.accessToken);
//   } catch (e) {
//     debugPrint(e.toString());
//   }
// }

// Future<String?> getToken() async {
//   try {
//     return await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
//   } catch (e) {
//     debugPrint(e.toString());
//   }
//   return null;
// }

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
