import 'package:bulka/core/services/categories/data/entity/category_type_entity.dart';
import 'package:bulka/core/shared/shimmer/shimmer_container_widget.dart';
import 'package:bulka/core/shared/shimmer/shimmer_text_widget.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/widgets/misc/default_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key,
    required this.category,
    required this.isLoading,
  });
  final CategoryTypeEntity? category;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        InkWell(
          onTap: () {
            if (category != null) {}
          },
          borderRadius: BorderRadius.circular(8.r),
          child: Card(
            color: AppColors.opactiyPrimary,
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r)),
            child: Padding(
              padding: EdgeInsets.all(12.r),
              child: isLoading
                  ? ShimmerContainerWidget(
                      isLoading: isLoading,
                      height: 38.h,
                      width: 38.w,
                    )
                  : category != null
                      ? DefaultNetworkImage(
                          category!.icon,
                          height: 38.h,
                          width: 38.w,
                        )
                      : const SizedBox(),
            ),
          ),
        ),
        Expanded(
          child: ShimmerTextWidget(
            category != null ? category!.name : 'Properties',
            style: TextStyles.rubik10W400BlueGrey,
            maxLines: 2,
            isLoading: isLoading,
          ),
        )
      ],
    );
  }
}
