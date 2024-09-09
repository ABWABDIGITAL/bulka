import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/modules/profile/ui/widgets/profile_basic_info_widget.dart';
import 'package:bulka/modules/profile/ui/widgets/profile_orders_taps_widget.dart';
import 'package:bulka/modules/profile/ui/widgets/profile_privacy_terms_widget.dart';
import 'package:bulka/modules/profile/ui/widgets/profile_title_widget.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProfileTitleWidget(),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ProfileOrdersTapsWidget(),
                ProfileBasicInfoWidget(),
                ProfilePrivacyTermsWidget(),
              ],
            ),
          ),
        )
      ],
    );
  }
}
