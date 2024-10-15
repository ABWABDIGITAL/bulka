import 'package:bulka/core/shared/shimmer/shimmer_text_widget.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class PostCommentsLoadingStateWidget extends StatelessWidget {
  const PostCommentsLoadingStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        8,
        (index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Shimmer(
                gradient: LinearGradient(
                  colors: [
                    AppColors.grey,
                    AppColors.grey.withOpacity(0.5),
                  ],
                ),
                child: const CircleAvatar(radius: 20),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShimmerTextWidget(
                      'username',
                      style: TextStyles.roboto14W600Black2,
                      isLoading: true,
                    ),
                    const SizedBox(height: 5),
                    ShimmerTextWidget(
                      AppStrings.loading.tr(),
                      style: TextStyles.rubik10W400Black100,
                      textAlign: TextAlign.start,
                      isLoading: true,
                    ),
                    const SizedBox(height: 5),
                    const ShimmerTextWidget(
                      'just now',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                      isLoading: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
