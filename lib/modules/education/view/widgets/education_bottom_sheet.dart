import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/services/servies_locator/service_locator.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/extensions/extensions.dart';
import 'package:bulka/modules/education/controller/education_cubit.dart';
import 'package:bulka/modules/education/view/screens/add_education_screen.dart';
import 'package:bulka/modules/education/view/widgets/education_list_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EducationBottomSheet extends StatelessWidget {
  const EducationBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EducationCubit(sl())..getEducation(),
      child: BlocBuilder<EducationCubit, EducationState>(
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
                    context.push(AddEducationScreen(
                      cubit: context.read<EducationCubit>(),
                    ));
                  },
                  title: Text(AppStrings.education.tr(),
                      style: TextStyles.rubik14W500Black),
                  leading: SvgPicture.asset(AssetIcons.educationSvg),
                  trailing: SvgPicture.asset(AssetIcons.addSvg),
                ),
                vSpace(16),
                
                const EducationListView(),
              ],
            ),
          );
        },
      ),
    );
  }
}
