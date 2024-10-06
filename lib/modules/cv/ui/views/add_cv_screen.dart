import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/shared/widgets/appbar_widget.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/widgets/buttons/default_button.dart';
import 'package:bulka/modules/cv/controllers/add/add_cv_cubit.dart';
import 'package:bulka/modules/cv/controllers/add/add_cv_state.dart';
import 'package:bulka/modules/cv/ui/widgets/show_cv_widget.dart';
import 'package:bulka/modules/cv/ui/widgets/upload_cv_widget.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

class AddCvScreen extends StatelessWidget {
  const AddCvScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddCvCubit(),
      child: Scaffold(
        appBar: OpacityAppbarWidget(title: AppStrings.cv.tr()),
        body: Padding(
          padding: EdgeInsets.all(16.r),
          child: BlocBuilder<AddCvCubit, AddCvState>(
            buildWhen: (previous, current) => previous != current,
            builder: (context, state) {
              final cubit = context.read<AddCvCubit>();
              return Column(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.addCv.tr(),
                          style: TextStyles.rubik14W500Black,
                        ),
                        vSpace(10),
                        DottedBorder(
                          borderType: BorderType.RRect,
                          radius: const Radius.circular(12),
                          padding: const EdgeInsets.all(2),
                          strokeWidth: .5,
                          dashPattern: const [6],
                          color: AppColors.iconGrey,
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12)),
                            child: Container(
                              height: cubit.pdf == null ? 107.h : null,
                              width: MediaQuery.sizeOf(context).width,
                              color: cubit.pdf == null
                                  ? AppColors.white
                                  : const Color(0xFF9D97B5).withOpacity(.3),
                              child: cubit.pdf == null
                                  ? const UploadCvWidget()
                                  : ShowCvWidget(cubit.pdf!),
                            ),
                          ),
                        ),
                        vSpace(20),
                        Text(
                          'Upload files in PDF format up to 5 MB. Just upload it once and you can use it in your next application.'
                              .tr(),
                          style: TextStyles.rubik18W300HardGrey
                              .copyWith(fontSize: 10.sp),
                        )
                      ],
                    ),
                  ),
                  DefaultButton(
                    text: AppStrings.upload.tr(),
                    onPressed: () {},
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
