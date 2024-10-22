import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/widgets/form_fields/default_form_field.dart';
import 'package:bulka/modules/work_experience/controller/work_experience_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddExperienceDateTime extends StatefulWidget {
  final WorkExperienceCubit cubit;
  const AddExperienceDateTime({super.key, required this.cubit});

  @override
  State<AddExperienceDateTime> createState() => _AddExperienceDateTimeState();
}

class _AddExperienceDateTimeState extends State<AddExperienceDateTime> {
  int difference = 0;

  startDateMethod() async {
    await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2001, 1, 1),
      lastDate: DateTime(2025, 12, 30),
    ).then((value) {
      setState(() {
        widget.cubit.selectedStartDate = value;
        widget.cubit.startDateController.text =
            '${widget.cubit.selectedStartDate!.day}/${widget.cubit.selectedStartDate!.month}/${widget.cubit.selectedStartDate!.year}';
      });
      if (value == null) {
        return;
      }
    });
  }

  endDateMethod() async {
    await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2001, 1, 1),
      lastDate: DateTime(2025, 12, 30),
    ).then((value) {
      setState(() {
        widget.cubit.selectedEndDate = value;
        widget.cubit.endDateController.text =
            '${widget.cubit.selectedEndDate!.day}/${widget.cubit.selectedEndDate!.month}/${widget.cubit.selectedEndDate!.year}';
      });
      if (value == null) {
        return;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.startDate.tr(),
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
                controller: widget.cubit.startDateController,
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
                controller: widget.cubit.endDateController,
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
