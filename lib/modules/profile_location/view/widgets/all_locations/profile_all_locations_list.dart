import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/modules/profile_location/view/widgets/all_locations/profile_all_locations_card.dart';
import 'package:flutter/material.dart';

class ProfileAllLocationsList extends StatelessWidget {
  const ProfileAllLocationsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: 3,
       
        separatorBuilder: (context, index) => vSpace(8),
        itemBuilder: (context, index) => const ProfileAllLocationsCard(),
      ),
    );
  }
}
