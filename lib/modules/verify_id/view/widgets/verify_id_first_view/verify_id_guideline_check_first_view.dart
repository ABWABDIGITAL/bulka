import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';

class VerifyIdGuidelineCheckFirstView extends StatelessWidget {
  final String text;
  const VerifyIdGuidelineCheckFirstView({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          const Icon(Icons.check_circle, color: Colors.green),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(color: AppColors.darkGrey6),
            ),
          ),
        ],
      ),
    );
  }
}
