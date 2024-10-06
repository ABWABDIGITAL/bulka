import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:flutter/material.dart';

class CreateAdTitleWidget extends StatelessWidget {
  const CreateAdTitleWidget({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyles.rubik13W500HardGrey2,
        ),
        const SizedBox(height: 6),
      ],
    );
  }
}
