import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/modules/cv/controllers/add/add_cv_cubit.dart';
import 'package:bulka/modules/cv/ui/widgets/show_cv_widget.dart';
import 'package:bulka/modules/cv/ui/widgets/upload_cv_widget.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddCvCard extends StatelessWidget {
  const AddCvCard({
    super.key,
    required this.cubit,
  });

  final AddCvCubit cubit;

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: const Radius.circular(12),
      padding: const EdgeInsets.all(2),
      strokeWidth: .5,
      dashPattern: const [6],
      color: AppColors.iconGrey,
      child: ClipRRect(
        borderRadius:
            const BorderRadius.all(Radius.circular(12)),
        child: InkWell(onTap: () {
        context.read<AddCvCubit>().pickPdfFile();
      },
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
    );
  }
}
