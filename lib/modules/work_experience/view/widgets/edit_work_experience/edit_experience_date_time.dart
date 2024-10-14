import 'dart:developer';

import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/modules/work_experience/controller/work_experience_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EditExperienceDateTime extends StatefulWidget {
  const EditExperienceDateTime({super.key});

  @override
  State<EditExperienceDateTime> createState() => _EditExperienceDateTimeState();
}

class _EditExperienceDateTimeState extends State<EditExperienceDateTime> {
int difference = 0;

  startDateMethod() async {
    final cubit = context.read<WorkExperienceCubit>();
    await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2001, 1, 1),
      lastDate: DateTime(2025, 12, 30),
    ).then((value) {
      setState(() {
        cubit.editSelectedStartDate = value;
        log('start :${cubit.editSelectedStartDate.toString()}');
      });
      if (value == null) {
        return;
      }
    });
  }

  endDateMethod() async {
    final cubit = context.read<WorkExperienceCubit>();
    await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2001, 1, 1),
      lastDate: DateTime(2025, 12, 30),
    ).then((value) {
      setState(() {
        cubit.editSelectedEndDate = value;
        log('end :${cubit.editSelectedEndDate.toString()}');
      });
      if (value == null) {
        return;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
     final cubit = context.read<WorkExperienceCubit>();
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
            OutlinedButton.icon(
              icon: SvgPicture.asset(
                AssetIcons.calenderSvg,
                color: AppColors.darkGrey5,
              ),
              //     iconAlignment: IconAlignment.start,
              style: OutlinedButton.styleFrom(
                alignment: AlignmentDirectional.centerStart,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                side: const BorderSide(color: AppColors.darkGrey3),
                minimumSize:
                    Size(MediaQuery.of(context).size.width / 2 - 4, 48),
              ),
              onPressed: () async {
                await startDateMethod();
                log(cubit.editSelectedStartDate.toString());
              },
              label: cubit.editSelectedStartDate == null
                  ? const Text('dd/mm/yy',
                      style: TextStyle(color: AppColors.darkGrey2))
                  : Text(
                      '${cubit.editSelectedStartDate!.day}/${cubit.editSelectedStartDate!.month}/${cubit.editSelectedStartDate!.year}',
                      style: const TextStyle(color: AppColors.black)),
            ),
          ],
        ),
      ),
      hSpace(8),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'End date',
              style: TextStyles.rubik14W500Black,
            ),
            vSpace(8),
            OutlinedButton.icon(
              icon: SvgPicture.asset(
                AssetIcons.calenderSvg,
                color: AppColors.darkGrey5,
              ),
              style: OutlinedButton.styleFrom(
                alignment: AlignmentDirectional.centerStart,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                side: const BorderSide(color: AppColors.darkGrey3),
                minimumSize: Size(MediaQuery.of(context).size.width / 2, 48),
              ),
              onPressed: () async {
                await endDateMethod();
                log(cubit.editSelectedEndDate.toString());
                setState(() {
                  difference = cubit.editSelectedEndDate!.difference(cubit.editSelectedStartDate!).inDays;
                });
                log(difference.toString());
              },
              label: cubit.editSelectedEndDate == null
                  ? const Text('dd/mm/yy',
                      style: TextStyle(color: AppColors.darkGrey2))
                  : Text('${cubit.editSelectedEndDate!.day}/${cubit.editSelectedEndDate!.month}/${cubit.editSelectedEndDate!.year}',
                      style: const TextStyle(color: AppColors.black)),
            ),
          ],
        ),
      ),
    ]);
  }
}
