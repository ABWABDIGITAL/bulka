import 'package:bulka/core/shared/widgets/appbar_widget.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/modules/ad_details_modules/jop_details/controllers/jop_details_cubit.dart';
import 'package:bulka/modules/ad_details_modules/jop_details/ui/widgets/jop_details_tabs_widget.dart';
import 'package:bulka/modules/ad_details_modules/jop_details/ui/widgets/jop_details_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JopDetailsScreen extends StatelessWidget {
  const JopDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => JopDetailsCubit(),
      child: Scaffold(
        appBar: const CustomAppBarWidget(
          height: 0,
          statusbarColor: AppColors.opactiyPrimary,
        ),
        body: Column(
          children: [
            const JopDetailsTitleWidget(),
            vSpace(16),
            const JopDetailsTabsWidget(),
          ],
        ),
      ),
    );
  }
}
