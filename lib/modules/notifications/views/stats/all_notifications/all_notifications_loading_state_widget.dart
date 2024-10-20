import 'package:bulka/core/shared/shimmer/shimmer_circuler_icon_widget.dart';
import 'package:bulka/core/shared/shimmer/shimmer_text_widget.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/widgets/format_date/date_format.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AllNotificationsLoadingStateWidget extends StatelessWidget {
  const AllNotificationsLoadingStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 8,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          elevation: 0,
          color: Colors.grey[200],
          child: ListTile(
            leading: const CircleAvatar(child: ShimmerCirculerIconWidget()),
            title: ShimmerTextWidget(
              AppStrings.loading.tr(),
              style: const TextStyle(fontWeight: FontWeight.bold),
              isLoading: true,
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShimmerTextWidget(
                  AppStrings.loading.tr(),
                  isLoading: true,
                ),
                const SizedBox(height: 5),
                ShimmerTextWidget(
                  'From: ${AppStrings.loading.tr()}',
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                ShimmerTextWidget(
                  'Sent: ${DateFormats.formatDateYearMonthDayHoursMinAmOrPm(DateTime.now().toString())}',
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                  isLoading: true,
                ),
              ],
            ),
            trailing: const ShimmerCirculerIconWidget(),
            onTap: () {},
          ),
        );
      },
    );
  }
}
