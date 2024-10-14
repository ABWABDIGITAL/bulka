import 'dart:math';

import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/shared/widgets/debouncer_widget.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/widgets/form_fields/default_form_field.dart';
import 'package:bulka/core/utils/widgets/loading/adaptive_circuler.dart';
import 'package:bulka/core/utils/widgets/misc/default_network_image.dart';
import 'package:bulka/modules/posts/data/entity/post_details_entity.dart';
import 'package:bulka/modules/posts_comments/controller/cubit/post_comments_cubit.dart';
import 'package:bulka/modules/posts_comments/controller/cubit/post_comments_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DefaultCommentFormFieldWidget extends StatelessWidget {
  const DefaultCommentFormFieldWidget(this.post, {super.key});
  final PostDetailsEntity post;

  @override
  Widget build(BuildContext context) {
    final debouncer = Debouncer(milliseconds: 300);
    return BlocBuilder<PostCommentsCubit, PostCommentsState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        final cubit = context.read<PostCommentsCubit>();
        return Column(
          children: [
            if (cubit.diplayImage != null)
              ListTile(
                leading: Image.file(
                  cubit.diplayImage!,
                  height: 40.h,
                  width: 40.w,
                ),
                title: cubit.fileSize == null
                    ? null
                    : Text(
                        _formatBytes(cubit.fileSize!),
                        style: TextStyles.mulish12W400Black,
                      ),
                trailing: IconButton(
                  icon: const Icon(
                    Icons.close,
                    color: AppColors.red,
                  ),
                  onPressed: () {
                    cubit.clearPickedImage();
                  },
                ),
              ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.grey),
                      borderRadius: BorderRadius.circular(10.r),
                      color: AppColors.mediumGrey8,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: DefaultFormField(
                            controller: cubit.commentController,
                            needValidation: false,
                            decoration: InputDecoration(
                              hintText: '${AppStrings.writeComment.tr()}...',
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                            ),
                            keyboardType: TextInputType.multiline,
                            maxLines: 6,
                            minLines: 1,
                            onChanged: (value) {
                              cubit.commentController.text = value;
                              debouncer.run(() {
                                cubit.emitText();
                              });
                            },
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            cubit.uploadImage();
                          },
                          child: SvgPicture.asset(
                            AssetIcons.imageSvg,
                            height: 20.h,
                            width: 20.w,
                          ),
                        ),
                        hSpace(10),
                      ],
                    ),
                  ),
                ),
                if (cubit.commentController.text.isNotEmpty ||
                    cubit.diplayImage != null)
                  hSpace(8),
                if (cubit.commentController.text.isNotEmpty ||
                    cubit.diplayImage != null)
                  GestureDetector(
                    onTap: state is SendCommentLoading
                        ? () {}
                        : () {
                            cubit.sendCommentStatesHandled(
                                post.adDetailsEntity.mainInfo.id);
                          },
                    child: Container(
                      height: 50.h,
                      width: 40.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.grey),
                        borderRadius: BorderRadius.circular(10.r),
                        color: AppColors.mediumGrey8,
                      ),
                      child: state is SendCommentLoading
                          ? const AdaptiveCircularProgress()
                          : const Icon(
                              Icons.send,
                              color: AppColors.primary,
                            ),
                    ).animate().fadeIn(),
                  ),
              ],
            ),
          ],
        );
      },
    );
  }

  String _formatBytes(int bytes) {
    if (bytes <= 0) return "0 B";
    const units = ['B', 'KB', 'MB', 'GB', 'TB'];
    int i = (log(bytes) / log(1024)).floor();
    return '${(bytes / pow(1024, i)).toStringAsFixed(2)} ${units[i]}';
  }
}
