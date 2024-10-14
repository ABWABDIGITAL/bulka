import 'dart:developer';

import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/services/servies_locator/service_locator.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/extensions/extensions.dart';
import 'package:bulka/modules/work_experience/controller/work_experience_cubit.dart';
import 'package:bulka/modules/work_experience/view/screens/add_work_experience_screen.dart';
import 'package:bulka/modules/work_experience/view/widgets/work_experiences_list_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WorkExperienceBottomSheet extends StatelessWidget {
  const WorkExperienceBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WorkExperienceCubit(sl())..getWorkExperiences(),
      child: BlocBuilder<WorkExperienceCubit, WorkExperienceState>(
        builder: (context, state) {
          return Container(
            decoration: const BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 40.w,
                  height: 4.h,
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: AppColors.black,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                ListTile(
                  onTap: () {
                    log('add work experience');
                    log('${context.read<WorkExperienceCubit>()}');
                    context.push(AddWorkExperienceScreen(
                      cubit: context.read<WorkExperienceCubit>(),
                    ));
                  },
                  title: Text(AppStrings.workExperience.tr(),
                      style: TextStyles.rubik14W500Black),
                  leading: SvgPicture.asset(AssetIcons.workExperienceSvg),
                  trailing: SvgPicture.asset(AssetIcons.addSvg),
                ),
                vSpace(16),
                const Divider(),
                const WorkExperiencesListView(),
              ],
            ),
          );
        },
      ),
    );
  }
}
