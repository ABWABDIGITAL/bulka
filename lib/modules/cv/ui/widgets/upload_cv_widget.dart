import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/modules/cv/controllers/add/add_cv_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class UploadCvWidget extends StatelessWidget {
  const UploadCvWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<AddCvCubit>().pickPdfFile();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AssetIcons.uploadSvg,
            height: 20.h,
            width: 20.w,
          ),
          hSpace(15),
          Text(
            AppStrings.uploadCvResume.tr(),
            style: TextStyles.rubik18W300HardGrey.copyWith(fontSize: 12.sp),
          )
        ],
      ),
    );
  }
}
