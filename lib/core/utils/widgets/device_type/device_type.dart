import 'dart:io';

import 'package:bulka/core/utils/widgets/responsive/responsive.dart';
import 'package:flutter/cupertino.dart';

enum DeviceTypeEnum { phone, phoneTablet, tablet, largeDevice, xLargeDevice }

class DeviceType {
  static String getDeviceTypeBySize(BuildContext context) {
    if (Responsive.isSmall(context)) {
      return DeviceTypeEnum.phone.name;
    }
    if (Responsive.isMedium(context)) {
      return DeviceTypeEnum.phoneTablet.name;
    }
    if (Responsive.isLarge(context)) {
      return DeviceTypeEnum.tablet.name;
    }
    if (Responsive.isXLarge(context)) {
      return DeviceTypeEnum.largeDevice.name;
    }
    if (Responsive.isXXLarge(context)) {
      return DeviceTypeEnum.xLargeDevice.name;
    }
    return DeviceTypeEnum.xLargeDevice.name;
  }

  static String getDeviceType() {
    if (Platform.isIOS) {
      return 'ios';
    }
    if (Platform.isAndroid) {
      return 'android';
    }
    if (Platform.isFuchsia) {
      return 'fuchsia';
    }
    if (Platform.isMacOS) {
      return 'mac os';
    }
    if (Platform.isLinux) {
      return 'linux';
    }
    return 'huawei';
  }
}
