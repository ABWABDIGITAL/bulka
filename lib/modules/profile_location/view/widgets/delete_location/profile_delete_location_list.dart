import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/modules/profile_location/view/widgets/delete_location/profile_delete_location_card.dart';
import 'package:flutter/material.dart';

class ProfileDeleteLocationsList extends StatelessWidget {
  const ProfileDeleteLocationsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: 3,
        separatorBuilder: (context, index) => vSpace(8),
        itemBuilder: (context, index) => const ProfileDeleteLocationRow(),
      ),
    );
  }
}
