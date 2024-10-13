import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/modules/education/data/entities/education_entity.dart';
import 'package:bulka/modules/education/view/widgets/education_list_tile.dart';
import 'package:flutter/material.dart';

class AllEducationSuccessView extends StatelessWidget {
  final List<EducationEntity> education;
  const AllEducationSuccessView({
    super.key,
    required this.education,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => EducationListTile(
              education: education[index],
            ),
        separatorBuilder: (context, index) => vSpace(8),
        itemCount: education.length);
  }
}
