import 'package:bulka/core/services/category_fields/data/entity/category_field_entity.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/widgets/form_fields/default_form_field.dart';
import 'package:bulka/modules/create_ad/data/params/create_ad_params.dart';
import 'package:flutter/cupertino.dart';

class DefaultCategoryFieldIntegerWidget extends StatelessWidget {
  const DefaultCategoryFieldIntegerWidget(
    this.categoryFieldEntity, {
    super.key,
    required this.formKey,
    this.onChange,
    this.onFinish,
  });
  final CategoryFieldEntity categoryFieldEntity;
  final Function(String? onChange)? onChange;
  final Function(CreateAdCategoryField onFinish)? onFinish;
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DefaultFormField(
            titleText: categoryFieldEntity.fieldName +
                (categoryFieldEntity.isRequired ? '*' : ""),
            hintText: categoryFieldEntity.fieldName,
            onChanged: (value) {
              onChange?.call(value);
            },
            onSaved: (value) {
              onFinish?.call(
                CreateAdCategoryField(
                  id: categoryFieldEntity.id,
                  fieldName: categoryFieldEntity.fieldName,
                  fieldValue: value!,
                  fieldType: categoryFieldEntity.fieldType.name,
                ),
              );
            },
            keyboardType: TextInputType.number,
            prefixIcon: const Icon(
              CupertinoIcons.number,
              color: AppColors.iconGrey,
            ),
          ),
          const SizedBox(height: 20)
        ],
      ),
    );
  }
}
