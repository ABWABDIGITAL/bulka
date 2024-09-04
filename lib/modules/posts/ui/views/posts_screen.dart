import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/shared/widgets/post_card_widget.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/widgets/misc/default_network_image.dart';
import 'package:bulka/core/utils/widgets/text/expandable_text.dart';
import 'package:bulka/modules/home/ui/widgets/home_appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppbarWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            PostCardWidget(),
          ],
        ),
      ),
    );
  }
}
