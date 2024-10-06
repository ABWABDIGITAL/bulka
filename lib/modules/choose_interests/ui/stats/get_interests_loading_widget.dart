import 'package:bulka/core/shared/shimmer/shimmer_container_widget.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/modules/choose_interests/data/entity/interests_entity.dart';
import 'package:bulka/modules/choose_interests/ui/widgets/interests_container_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class InterestsLoadingWidget extends StatelessWidget {
  const InterestsLoadingWidget({
    super.key,
    required this.gridDelegate,
  });
  final SliverGridDelegate gridDelegate;
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: gridDelegate,
      itemCount: 8,
      itemBuilder: (context, index) {
        return InterestsContainerWidget(
          isLoading: true,
          interests: InterestsEntity(
            image:
                'https://s3-alpha-sig.figma.com/img/277f/4b89/b9db8b70271d8d5f4ad127054bb9cb02?Expires=1726444800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=aXa9PYcK2Ni~ZUNWLzarVq9QeMsoa3nH3l6lId-2bah35wWMiznKLmJh-kuZhlKMpBJeyRb1QvQ0Wt0PX0hd9-zzLU05B6OLw0EW4TKqhRTCqiFAY6LS~3YMrrGIQ6gHYmfRmc7-RKcSP8vLqyeDS1Mkj9bdPfA7GBKpu82lgtkPw4Cr54JvDx3SvIcsXv2GQsUUaF6N5AsVPATHQeq0fsi0i69edq3T0lFSCF96GfNeByTuhKbhJ0XB9IbLwzjLdr5JvPV-Nuqj9~84pOM5Tguk~RnPz6x6c5sYNWMQEFdZ5uC11eV1ay2M3IQmDuLMy~wc5rDtGgAhaOtvI9atUQ__',
            name: AppStrings.loading.tr(),
            id: 0,
          ),
        );
      },
    );
  }
}
