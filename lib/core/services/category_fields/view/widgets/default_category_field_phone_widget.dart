import 'package:bulka/core/services/category_fields/data/entity/category_field_entity.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/widgets/form_fields/default_form_field.dart';
import 'package:flutter/cupertino.dart';

class DefaultCategoryFieldIntegerWidget extends StatelessWidget {
  const DefaultCategoryFieldIntegerWidget(
    this.categoryFieldEntity, {
    super.key,
  });
  final CategoryFieldEntity categoryFieldEntity;

  @override
  Widget build(BuildContext context) {
    return DefaultFormField(
      titleText: categoryFieldEntity.fieldName,
      hintText: categoryFieldEntity.fieldName,
      onChanged: (value) {},
      keyboardType: TextInputType.number,
      prefixIcon: const Icon(
        CupertinoIcons.number,
        color: AppColors.iconGrey,
      ),
    );
  }
}
