import 'package:bulka/app/providers_list.dart';
import 'package:bulka/core/route/app_router.dart';
import 'package:bulka/core/route/routes.dart';
import 'package:bulka/core/services/profile_info/controller/cubit/my_profile_info_cubit.dart';
import 'package:bulka/core/services/servies_locator/service_locator.dart';
import 'package:bulka/core/theme/theme_data/light_theme.dart';
import 'package:bulka/core/utils/constant/app_env.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(375, 812),
      // child: const SplashScreen(),
      builder: (context, child) => MultiBlocProvider(
        providers: providersList,
        child: MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          title: AppEnv.projectName,
          theme: getLightTheme(),
          // home: child,
          initialRoute: Routes.splash,
          onGenerateRoute: AppRouter.generateRoute,
        ),
      ),
    );
  }
}
