import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/shared/shimmer/shimmer_circuler_icon_widget.dart';
import 'package:bulka/core/shared/shimmer/shimmer_container_widget.dart';
import 'package:bulka/core/shared/shimmer/shimmer_text_widget.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/widgets/format_date/date_format.dart';
import 'package:bulka/modules/chats/all_chats/views/widgets/chat_history_item_widget.dart';
import 'package:bulka/modules/chats/all_chats/views/widgets/filter_history_chip_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AllChatsLoadingStateWidget extends StatelessWidget {
  const AllChatsLoadingStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FilterHistoryChipWidget(
                avatar: SvgPicture.asset(AssetIcons.startInCircleSvg),
                label: AppStrings.all.tr(),
                isLoading: true,
              ),
              FilterHistoryChipWidget(
                avatar: SvgPicture.asset(
                  AssetIcons.startInCircleSvg,
                  color: AppColors.yellow,
                ),
                label: AppStrings.important.tr(),
                isLoading: true,
              ),
              FilterHistoryChipWidget(
                avatar: SvgPicture.asset(
                  AssetIcons.startInCircleSvg,
                  color: AppColors.orange,
                ),
                label: AppStrings.unreadChat.tr(),
                isLoading: true,
              ),
            ],
          ),
        ),
        const Divider(thickness: 1, color: AppColors.grey),
        Expanded(
          child: ListView(
            children: List.generate(10, (index) {
              return Column(
                children: [
                  Container(
                    color:
                        index.isOdd ? const Color(0xFFF5F7FC) : AppColors.white,
                    padding: EdgeInsets.zero,
                    child: ListTile(
                      leading: ShimmerCirculerIconWidget(
                        child: CircleAvatar(
                          backgroundColor: AppColors.white,
                          child: SvgPicture.asset(
                            AssetIcons.appIconSvg,
                            height: 18.h,
                            width: 18.w,
                          ),
                        ),
                      ),
                      title: ShimmerTextWidget(
                        AppStrings.loading.tr(),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                        isLoading: true,
                      ),
                      subtitle: ShimmerTextWidget(
                        AppStrings.loading.tr(),
                        isLoading: true,
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ShimmerTextWidget(
                            DateFormats.formatDateYearMonthDayHoursMinAmOrPm(
                                DateTime.now().toString()),
                            isLoading: true,
                          ),
                          if (index.isOdd)
                            ShimmerContainerWidget(
                              margin: const EdgeInsets.only(top: 4),
                              padding: const EdgeInsets.all(6),
                              decoration: const BoxDecoration(
                                color: Colors.blue,
                                shape: BoxShape.circle,
                              ),
                              child: index.isOdd
                                  ? const Text(
                                      '1',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12),
                                    )
                                  : null,
                            )
                        ],
                      ),
                    ),
                  ),
                  const Divider()
                ],
              );
            }),
          ),
        ),
      ],
    );
  }
}
