import 'package:bulka/core/services/servies_locator/service_locator.dart';
import 'package:bulka/modules/home_templet/controllers/home_cubit.dart';
import 'package:bulka/modules/home_templet/ui/widgets/home_banners_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<HomeCubit>()..homeBannersStatesHandled(),
      child: CustomScrollView(
        slivers: [
          HomeBannersWidget(),
        ],
      ),
    );
  }
}
