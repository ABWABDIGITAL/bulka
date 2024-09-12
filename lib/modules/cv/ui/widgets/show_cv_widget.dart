import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/modules/cv/controllers/add/add_cv_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ShowCvWidget extends StatelessWidget {
  const ShowCvWidget(this.pdf, {super.key});
  final FilePickerResult pdf;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        vSpace(20),
        Row(
          children: [
            Image.asset(
              AssetIcons.pdf,
              height: 40.h,
              width: 40.w,
            ),
            hSpace(15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pdf.files.first.name,
                    style: TextStyles.rubik10W400Black100
                        .copyWith(fontSize: 12.sp),
                  ),
                  vSpace(5),
                  Text(
                    _formatFileSize(pdf.files.first.size),
                    style: TextStyles.rubik10W400Black100
                        .copyWith(fontSize: 12.sp, color: AppColors.greyFont),
                  ),
                ],
              ),
            )
          ],
        ),
        vSpace(20),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: GestureDetector(
            onTap: () {
              context.read<AddCvCubit>().clearPickedFile();
            },
            child: Row(
              children: [
                hSpace(10),
                SvgPicture.asset(
                  AssetIcons.trashFill,
                  height: 20.h,
                  width: 20.w,
                ),
                hSpace(20),
                Expanded(
                    child: Text(
                  AppStrings.removeFile.tr(),
                  style: TextStyles.rubik10W400Black100
                      .copyWith(fontSize: 12.sp, color: AppColors.red),
                ))
              ],
            ),
          ),
        ),
        vSpace(20),
      ],
    );
  }

  String _formatFileSize(int size) {
    if (size < 1024) {
      return '$size Bytes';
    } else if (size < 1024 * 1024) {
      double kiloBytes = size / 1024;
      return '${kiloBytes.toStringAsFixed(2)} KB';
    } else {
      double megaBytes = size / (1024 * 1024);
      return '${megaBytes.toStringAsFixed(2)} MB';
    }
  }
}
