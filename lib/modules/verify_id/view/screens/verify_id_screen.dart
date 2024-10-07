import 'package:bulka/core/shared/widgets/appbar_widget.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/widgets/buttons/default_button.dart';
import 'package:bulka/modules/verify_id/view/widgets/verify_id_first_view/verify_id_first_view.dart';
import 'package:bulka/modules/verify_id/view/widgets/verify_id_second_view/verify_id_second_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerifyIdScreen extends StatefulWidget {
  const VerifyIdScreen({super.key});

  @override
  State<VerifyIdScreen> createState() => _VerifyIdScreenState();
}

class _VerifyIdScreenState extends State<VerifyIdScreen> {
  final List<Widget> _pages = [
    const VerifyIdFirstView(),
    const VerifyIdSecondView(),
  ];
  int currnetContectindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(
        title: AppStrings.verifyId.tr(),
        titleStyle: TextStyles.rubik14W500Black,
        centerTitle: true,
      ),
      body: Padding(
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
                    color: index <= currnetContectindex
                        ? AppColors.primary
                        : AppColors.darkGrey3,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
           vSpace(20),

            Expanded(child: _pages[currnetContectindex]), // Next button
            DefaultButton(
              text: currnetContectindex == 0
                  ? 'Next'
                  : currnetContectindex == 1
                      ? 'Check'
                      : '',
              onPressed: () {
                setState(() {
                  if (currnetContectindex < 2) {
                    currnetContectindex++;
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
