import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/widgets/form_fields/default_form_field.dart';
import 'package:bulka/modules/education/controller/education_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EditEducationDateTime extends StatefulWidget {
  const EditEducationDateTime({super.key});

  @override
  State<EditEducationDateTime> createState() => _EditEducationDateTimeState();
}

class _EditEducationDateTimeState extends State<EditEducationDateTime> {
  int difference = 0;

  startDateMethod() async {
    final cubit = context.read<EducationCubit>();
    await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2001, 1, 1),
      lastDate: DateTime(2025, 12, 30),
    ).then((value) {
      setState(() {
        cubit.editSelectedStartDate = value;
        cubit.editStartDateController.text =
            '${cubit.editSelectedStartDate!.day}/${cubit.editSelectedStartDate!.month}/${cubit.editSelectedStartDate!.year}';
      });
      if (value == null) {
        return;
      }
    });
  }

  endDateMethod() async {
    final cubit = context.read<EducationCubit>();
    await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2001, 1, 1),
      lastDate: DateTime(2025, 12, 30),
    ).then((value) {
      setState(() {
        cubit.editSelectedEndDate = value;
        cubit.editEndDateController.text =
            '${cubit.editSelectedEndDate!.day}/${cubit.editSelectedEndDate!.month}/${cubit.editSelectedEndDate!.year}';
      });
      if (value == null) {
        return;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<EducationCubit>();
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Start date',
              style: TextStyles.rubik14W500Black,
            ),
            vSpace(8),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2 - 4,
              child: DefaultFormField(
                prefixIconConstraints: const BoxConstraints(
                  minWidth: 24,
                  minHeight: 24,
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: SvgPicture.asset(AssetIcons.calenderSvg,
                      color: AppColors.darkGrey5),
                ),
                controller: cubit.editStartDateController,
                hintText: 'dd/mm/yy',
                onTap: () async {
                  await startDateMethod();
                },
              ),
            )
          ],
        ),
      ),
      hSpace(8),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.endDate.tr(),
              style: TextStyles.rubik14W500Black,
            ),
            vSpace(8),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2 - 4,
              child: DefaultFormField(
                prefixIconConstraints: const BoxConstraints(
                  minWidth: 24,
                  minHeight: 24,
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: SvgPicture.asset(AssetIcons.calenderSvg,
                      color: AppColors.darkGrey5),
                ),
                controller: cubit.editEndDateController,
                hintText: 'dd/mm/yy',
                onTap: () async {
                  await endDateMethod();
                },
              ),
            )
          ],
        ),
      ),
    ]);
  }
}
