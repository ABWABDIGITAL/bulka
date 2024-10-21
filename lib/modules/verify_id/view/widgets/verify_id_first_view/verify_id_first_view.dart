import 'dart:developer';
import 'dart:io';

import 'package:bulka/core/assets/asset_images.dart';
import 'package:bulka/core/services/handlers/image_picker_handler.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/modules/verify_id/controllers/verify_id_cubit.dart';
import 'package:bulka/modules/verify_id/view/widgets/verify_id_first_view/verify_id_guideline_list.dart';
import 'package:bulka/modules/verify_id/view/widgets/verify_id_photo_container.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerifyIdFirstView extends StatefulWidget {
  const VerifyIdFirstView({super.key});

  @override
  State<VerifyIdFirstView> createState() => _VerifyIdFirstViewState();
}

class _VerifyIdFirstViewState extends State<VerifyIdFirstView> {
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
              cubit.idImage = image;
              log('image: ${image!.path}');
              setState(() {});
            },
            borderRadius: BorderRadius.circular(16.r),
            child: image == null
                ? VerifyIdPhotoContainer(
                    image: AssetImages.veridyId,
                    title: AppStrings.idVerification.tr(),
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
        vSpace(20),
        Text(
          AppStrings.importantGuidelinesForYourIdentity.tr(),
          style: TextStyles.rubik14W400Black2,
        ),
        vSpace(10),
        const VerifyIdGuidelineList(),
        const Spacer(),
      ],
    );
  }
}
