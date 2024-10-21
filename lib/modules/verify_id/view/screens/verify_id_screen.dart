import 'package:bulka/core/services/servies_locator/service_locator.dart';
import 'package:bulka/core/shared/widgets/appbar_widget.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/modules/verify_id/controllers/verify_id_cubit.dart';
import 'package:bulka/modules/verify_id/view/widgets/verify_id_check_button.dart';
import 'package:bulka/modules/verify_id/view/widgets/verify_id_first_view/verify_id_first_view.dart';
import 'package:bulka/modules/verify_id/view/widgets/verify_id_second_view/verify_id_second_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerifyIdScreen extends StatelessWidget {
  const VerifyIdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      const VerifyIdFirstView(),
      const VerifyIdSecondView(),
      const VerifyIdSecondView(),
    ];

    return Scaffold(
      appBar: CustomAppBarWidget(
        title: AppStrings.verifyId.tr(),
        titleStyle: TextStyles.rubik14W500Black,
        centerTitle: true,
        iconTheme: const IconThemeData(color: AppColors.black),
        backgroundColor: AppColors.opactiyPrimary,
      ),
      body: BlocProvider(
        create: (context) => VerifyIdCubit(sl()),
        child: BlocBuilder<VerifyIdCubit, VerifyIdState>(
          buildWhen: (previous, current) =>
          current is VerifyIdLoading ||
          current is VerifyIdLoaded ||
          current is VerifyIdError ||
          current is VerifyIdUpdateIndex,
          builder: (context, state) {
            final cubit = context.read<VerifyIdCubit>();
            return Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      3,
                      (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        width: 80.w,
                        height: 3,
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          color: index <= cubit.currentContentIndex
                              ? AppColors.primary
                              : AppColors.darkGrey3,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  vSpace(20),

                  Expanded(
                      child: pages[cubit.currentContentIndex]), // Next button
                  VerifyIdCheckButton(
                    
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
