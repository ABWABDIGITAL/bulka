import 'package:bulka/core/services/network/dio_helper.dart';
import 'package:bulka/core/services/ob_servable/ob_server.dart';
import 'package:bulka/core/services/cache/shared_pref.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> initLocator() async {
  DioHelper.init();
  await Future.wait([
    SharedPrefHelper.init(),
    ScreenUtil.ensureScreenSize(),
  ]);

  EasyLocalization.ensureInitialized();
  Bloc.observer = MyBlocObserver();
}
