import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/widgets/format_date/date_format.dart';
import 'package:bulka/core/utils/widgets/text/expandable_text.dart';
import 'package:bulka/modules/posts_module/post_details/ui/widgets/post_details_buttons_widget.dart';
import 'package:bulka/modules/posts_module/post_details/ui/widgets/post_details_divider_widget.dart';
import 'package:bulka/modules/posts_module/post_details/ui/widgets/post_details_info_widget.dart';
import 'package:bulka/modules/posts_module/post_details/ui/widgets/post_details_owner_widget.dart';
import 'package:bulka/modules/posts_module/post_details/ui/widgets/post_details_payment_details_widget.dart';
import 'package:bulka/modules/posts_module/post_details/ui/widgets/post_image_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class PostDetailsScreen extends StatefulWidget {
  const PostDetailsScreen({super.key});
  @override
  State<PostDetailsScreen> createState() => _PostDetailsScreenState();
}

class _PostDetailsScreenState extends State<PostDetailsScreen> {
  late ScrollController _scrollController;
  bool _isAppBarCollapsed = false;
  bool _isAppBarExpanded = false;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    _scrollController.addListener(_handleScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _handleScroll() {
    final maxExtent = (MediaQuery.of(context).size.height * .5);
    const minExtent = kToolbarHeight;

    final isAppBarCollapsed =
        _scrollController.offset > (maxExtent - minExtent);
    final isAppBarExpanded = _scrollController.offset < maxExtent;

    if (isAppBarCollapsed != _isAppBarCollapsed ||
        isAppBarExpanded != _isAppBarExpanded) {
      setState(() {
        _isAppBarCollapsed = isAppBarCollapsed;
        _isAppBarExpanded = isAppBarExpanded;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              controller: _scrollController,
              slivers: [
                PostImageWidget(_isAppBarCollapsed, _isAppBarExpanded),
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const PostDetailsOwnerWidget(),
                      const PostDetailsDividerWidget(),
                      vSpace(20),
                      const PostDetailsInfoWidget(),
                      vSpace(20),
                      const PostDetailsDividerWidget(),
                      const PostDetailsPaymentDetailsWidget(),
                      vSpace(20),
                    ],
                  ),
                )
              ],
            ),
          ),
          const PostDetailsButtonsWidget(),
        ],
      ),
    );
  }
}
