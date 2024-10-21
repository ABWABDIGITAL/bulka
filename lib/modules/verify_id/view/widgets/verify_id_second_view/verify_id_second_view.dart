import 'dart:developer';
import 'dart:io';

import 'package:bulka/core/assets/asset_images.dart';
import 'package:bulka/core/services/handlers/image_picker_handler.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/modules/verify_id/controllers/verify_id_cubit.dart';
import 'package:bulka/modules/verify_id/view/widgets/verify_id_photo_container.dart';
import 'package:bulka/modules/verify_id/view/widgets/verify_id_second_view/verify_id_guideline_list_second_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerifyIdSecondView extends StatefulWidget {
  const VerifyIdSecondView({super.key});

  @override
  State<VerifyIdSecondView> createState() => _VerifyIdSecondViewState();
}

class _VerifyIdSecondViewState extends State<VerifyIdSecondView> {
  File? image;
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<VerifyIdCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
            onTap: () async {
              setState(() {
                image = null;
              });
              image = await ImagePickerHandler().getSingleImage();
              cubit.selfImage = image;
              log('image: ${image!.path}');
              setState(() {});
            },
            borderRadius: BorderRadius.circular(16.r),
            child: image == null
                ? VerifyIdPhotoContainer(
                    image: AssetImages.selfPhoto,
                    title: AppStrings.selfPhoto.tr(),
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(16.r),
                    child: Image.file(
                      image!,
                      height: 200.h,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.fill,
                    ),
                  )),
        vSpace(16),
        const VerifyIdGuidelineListSecondView(),
        const Spacer(),
      ],
    );
  }
}
