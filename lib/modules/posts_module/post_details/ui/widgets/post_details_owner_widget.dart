import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/widgets/format_date/date_format.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PostDetailsOwnerWidget extends StatelessWidget {
  const PostDetailsOwnerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundImage: NetworkImage(
            'https://images.unsplash.com/photo-1724963335855-93f74796d4bc?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwxNDd8fHxlbnwwfHx8fHw%3D'),
      ),
      title: Row(
        children: [
          Expanded(
            child: Text(
              'Abdullah Ezz',
              style: TextStyles.rubik14W500Black,
            ),
          ),
          Text(
            DateFormats.formatDateMMMMEEEEd(DateTime.now().toString()),
            style: TextStyles.rubik9W400MediumGrey9,
          )
        ],
      ),
      subtitle: Row(
        children: [
          SvgPicture.asset(AssetIcons.verifySvg),
          hSpace(10),
          Text(
            AppStrings.verified.tr(),
            style: TextStyles.rubik13W500Green2,
          )
        ],
      ),
    );
  }
}
