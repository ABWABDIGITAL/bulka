import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/widgets/buttons/default_button.dart';
import 'package:bulka/core/utils/widgets/dialogs/dialogs.dart';
import 'package:bulka/modules/choose_interests/controllers/choose_interests_cubit.dart';
import 'package:bulka/modules/choose_interests/controllers/choose_interests_state.dart';
import 'package:bulka/modules/choose_interests/ui/widgets/choose_interests_success_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SendInterestsButtonWidget extends StatelessWidget {
  const SendInterestsButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ChooseInterestsCubit>();
    return BlocConsumer<ChooseInterestsCubit, ChooseInterestsState>(
      listenWhen: (previous, current) =>
          current is SendInterestsSuccess ||
          current is SendInterestsError ||
          current is SendInterestsLoading,
      listener: (context, state) {
        if (state is SendInterestsSuccess) {
          chooseInterestsSuccessDialog(context);
        }
        if (state is SendInterestsError) {
          Dialogs.errorDialog(context: context, error: state.error);
        }
      },
      buildWhen: (previous, current) =>
          current is SendInterestsSuccess ||
          current is SendInterestsError ||
          current is SendInterestsLoading ||
          current is ChoosenInterstUpdated,
      builder: (context, state) {
        return cubit.choosenInterests.isNotEmpty
            ? Padding(
                padding: EdgeInsets.symmetric(vertical: 20.r),
                child: DefaultButton(
                  isLoading: state is SendInterestsLoading ? true : false,
                  text: AppStrings.Continue.tr(),
                  onPressed: () {
                    cubit.sendInterestsStatesHandled();
                  },
                ),
              ).animate().moveY(
                  begin: 250,
                  end: 1,
                  curve: Curves.easeOutCubic,
                )
            : const SizedBox();
      },
    );
  }
}
