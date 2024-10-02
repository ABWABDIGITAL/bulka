import 'package:bulka/core/services/category_fields/data/entity/category_field_entity.dart';
import 'package:flutter/material.dart';

class DefaultCategoryFieldBooleanWidget extends StatefulWidget {
  const DefaultCategoryFieldBooleanWidget(
    this.categoryFieldEntity, {
    super.key,
    this.onSelected,
  });
  final CategoryFieldEntity categoryFieldEntity;
  final Function(CategoryFieldValuesEntity? choosenCategory)? onSelected;

  @override
  State<DefaultCategoryFieldBooleanWidget> createState() =>
      _DefaultCategoryFieldBooleanWidgetState();
}

class _DefaultCategoryFieldBooleanWidgetState
    extends State<DefaultCategoryFieldBooleanWidget> {
  CategoryFieldValuesEntity? _selectedCategoryField;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.categoryFieldEntity.fieldName),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: List.generate(
            widget.categoryFieldEntity.fieldValue.length,
            (index) {
              return RadioListTile<CategoryFieldValuesEntity>(
                title: Text(
                    widget.categoryFieldEntity.fieldValue[index].fieldValue),
                value: widget.categoryFieldEntity.fieldValue[index],
                groupValue: _selectedCategoryField,
                onChanged: (value) {
                  setState(() {
                    _selectedCategoryField = value;
                  });
                  widget.onSelected?.call(_selectedCategoryField);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
