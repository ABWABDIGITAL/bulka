import 'dart:io';
import 'package:bulka/core/shared/components/default_ink_well_widget.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CircleNavigateBackWidget extends StatelessWidget {
  const CircleNavigateBackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: AppColors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(80),
        side: const BorderSide(
          color: AppColors.grey,
        ),
      ),
      child: CustomeInkWellWidget(
        onTap: () {
          Navigator.pop(context);
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Icon(
            Platform.isIOS ? CupertinoIcons.back : Icons.arrow_back,
            color: AppColors.grey,
          ),
        ),
      ),
    );
  }
}
