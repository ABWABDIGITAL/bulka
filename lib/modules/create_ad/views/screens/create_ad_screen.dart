import 'package:bulka/core/shared/widgets/appbar_widget.dart';
import 'package:bulka/core/utils/constant/strings.dart';
import 'package:bulka/core/utils/widgets/form_fields/default_category_drop_down_widget.dart';
import 'package:flutter/material.dart';

class CreateAdScreen extends StatelessWidget {
  const CreateAdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomeAppBarWidget(),
      body: Column(
        children: [
          DefaultCategoryDropdownWidget(),
        ],
      ),
    );
  }
}
