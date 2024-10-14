import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/extensions/extensions.dart';
import 'package:bulka/core/utils/widgets/buttons/default_button.dart';
import 'package:bulka/core/utils/widgets/dialogs/dialogs.dart';
import 'package:bulka/modules/education/controller/education_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EducationRemoveBottomSheet extends StatelessWidget {
  final EducationCubit educationCubit;
  const EducationRemoveBottomSheet({super.key, required this.educationCubit});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: educationCubit,
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "${AppStrings.removeEducation.tr()} 🥲",
              style: TextStyles.rubik17W500Black,
            ),
            vSpace(16),
            Text(
              AppStrings.areYouSureYouWantToDeleteThisEducation.tr(),
              style: TextStyles.rubik14W400DarkGrey2,
            ),
            vSpace(16),
            Row(
              children: [
                Expanded(
                    child: RemoveEducation(
                  workCubit: educationCubit,
                )),
                hSpace(8),
                Expanded(
                    child: DefaultButton(
                  textStyle: TextStyles.rubik14W500MediumGrey8,
                  backgroundColor: AppColors.mediumGrey15,
                  text: AppStrings.no.tr(),
                  onPressed: () {
                    context.pop();
                  },
                  elevation: 0,
                )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class RemoveEducation extends StatelessWidget {
  final EducationCubit workCubit;
  const RemoveEducation({
    super.key,
    required this.workCubit,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: workCubit,
      child: BlocConsumer<EducationCubit, EducationState>(
        listenWhen: (previous, current) =>
            current is PostEducationLoading ||
            current is PostEducationLoaded ||
            current is PostEducationError,
        listener: (context, state) {
          if (state is PostEducationError) {
            Dialogs.errorDialog(context: context, error: state.error);
          }
          if (state is PostEducationLoaded) {
            context.pop();
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text(state.message),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(AppStrings.ok.tr()),
                  ),
                ],
              ),
            );
          }
        },
        buildWhen: (previous, current) =>
            current is PostEducationLoading ||
            current is PostEducationLoaded ||
            current is PostEducationError,
        builder: (context, state) {
          var cubit = context.read<EducationCubit>();

          return DefaultButton(
            onPressed: () {
              cubit.removeEducation();
            },
            isLoading: state is PostEducationLoading ? true : false,
            text: AppStrings.yes.tr(),

            //  isLoading: state is LoginStateLoading ? true : false,
          );
        },
      ),
    );
  }
}
