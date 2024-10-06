import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/modules/choose_interests/controllers/choose_interests_cubit.dart';
import 'package:bulka/modules/choose_interests/controllers/choose_interests_state.dart';
import 'package:bulka/modules/choose_interests/ui/stats/get_interests_error_widget.dart';
import 'package:bulka/modules/choose_interests/ui/stats/get_interests_loading_widget.dart';
import 'package:bulka/modules/choose_interests/ui/stats/get_interests_success_widget.dart';
import 'package:bulka/modules/choose_interests/ui/widgets/interests_skip_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChooseInterestsBodyWidget extends StatelessWidget {
  const ChooseInterestsBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ChooseInterestsCubit>();
    final SliverGridDelegate gridDelegate =
        SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: 171.w / 149.h,
      mainAxisSpacing: 16.h,
      crossAxisSpacing: 12.w,
    );
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: vSpace(16)),
        const InterestsSkipWidget(),
        SliverToBoxAdapter(child: vSpace(16)),
        SliverToBoxAdapter(
          child: Text(
            AppStrings.whatAreYourInterstsInBuying.tr(),
            style: TextStyles.rubik20W600Black,
          ),
        ),
        SliverToBoxAdapter(child: vSpace(16)),
        BlocBuilder<ChooseInterestsCubit, ChooseInterestsState>(
          buildWhen: (previous, current) =>
              current is GetInterestsLoading ||
              current is GetInterestsSuccess ||
              current is GetInterestsError ||
              current is ChoosenInterstUpdated,
          builder: (context, state) {
            if (state is GetInterestsLoading) {
              return InterestsLoadingWidget(gridDelegate: gridDelegate);
            }
            if (state is GetInterestsError) {
              return InterestsErrorWidget(state.error);
            }
            if (cubit.allInterests != null || state is GetInterestsSuccess) {
              return InterestsSuccessWidget(
                gridDelegate: gridDelegate,
                interests: cubit.allInterests!,
              );
            }
            return const Text('no state provided');
          },
        )
      ],
    );
  }
}
