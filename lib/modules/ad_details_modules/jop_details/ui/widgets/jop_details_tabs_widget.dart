import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/modules/ad_details_modules/jop_details/controllers/jop_details_cubit.dart';
import 'package:bulka/modules/ad_details_modules/jop_details/controllers/jop_details_state.dart';
import 'package:bulka/modules/ad_details_modules/jop_details/ui/widgets/jop_details_overview_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JopDetailsTabsWidget extends StatefulWidget {
  const JopDetailsTabsWidget({super.key});

  @override
  State<JopDetailsTabsWidget> createState() => _JopDetailsTabsWidgetState();
}

class _JopDetailsTabsWidgetState extends State<JopDetailsTabsWidget>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    context.read<JopDetailsCubit>().initTabController(this);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JopDetailsCubit, JopDetailsState>(
      buildWhen: (previous, current) => current is UpdateTabController,
      builder: (context, state) {
        return Expanded(
          child: Column(
            children: [
              const Divider(color: AppColors.softGrey3),
              TabBar(
                dividerColor: AppColors.softGrey3,
                labelColor: AppColors.lightPrimary,
                indicatorColor: AppColors.lightPrimary,
                unselectedLabelColor: AppColors.darkGrey5,
                indicatorSize: TabBarIndicatorSize.tab,
                labelStyle: TextStyles.rubik15W500Primary,
                unselectedLabelStyle: TextStyles.rubik14W400DarkGrey5,
                controller: context.read<JopDetailsCubit>().tabController,
                tabs: [
                  Tab(text: AppStrings.overView.tr()),
                  Tab(text: AppStrings.company.tr()),
                  Tab(text: AppStrings.reviews.tr()),
                ],
              ),
              Expanded(
                child: TabBarView(
                  controller: context.read<JopDetailsCubit>().tabController,
                  children: [
                    JopDetailsOverviewWidget(),
                    Container(color: AppColors.red),
                    Container(color: AppColors.black),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
