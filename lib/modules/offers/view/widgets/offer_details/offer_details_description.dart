import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:flutter/material.dart';

class OfferDetailsDescription extends StatelessWidget {
  final String description;
  const OfferDetailsDescription({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Text(description, style: TextStyles.rubik14W400DarkGrey2);
  }
}
