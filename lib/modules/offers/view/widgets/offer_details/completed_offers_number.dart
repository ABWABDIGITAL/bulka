import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';

class CompletedOffersNumber extends StatelessWidget {
  const CompletedOffersNumber({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircleAvatar(
        radius: 20,
        backgroundColor: AppColors.primary.withOpacity(.2),
        child: const Text(
          "1",
          style: TextStyle(color: AppColors.darkGrey),
        ),
      ),
    );
  }
}

