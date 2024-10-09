import 'package:bulka/core/shared/widgets/carousal_widget.dart';
import 'package:bulka/core/shared/widgets/zoom_in_image_list_widget.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/widgets/empty/empty_widget.dart';
import 'package:bulka/core/utils/widgets/misc/default_network_image.dart';
import 'package:bulka/core/utils/widgets/navigation/navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostImageWidget extends StatefulWidget {
  const PostImageWidget(this.isAppBarCollapsed, this.isAppBarExpanded,
      {super.key});
  final bool isAppBarCollapsed;
  final bool isAppBarExpanded;
  @override
  State<PostImageWidget> createState() => _PostImageWidgetState();
}

class _PostImageWidgetState extends State<PostImageWidget> {
  int activeImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<String> images = [
      'https://images.unsplash.com/photo-1724893973738-a80d90811389?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwxN3x8fGVufDB8fHx8fA%3D%3D',
      'https://plus.unsplash.com/premium_photo-1686247902756-065dd7a6faa6?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwxNXx8fGVufDB8fHx8fA%3D%3D',
    ];
    final expandedHeight = MediaQuery.sizeOf(context).height * .5;
    return SliverAppBar(
      expandedHeight: expandedHeight,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            if (images.isNotEmpty)
              SharedCarousalWidget(
                itemBuilder: (context, index, reelIndex) => InkWell(
                  onTap: () {
                    Move.navigateToFade(context,
                        ZoomImageListScreen(urlImage: images, index: index));
                  },
                  child: DefaultNetworkImage(
                    images[index],
                    fit: BoxFit.cover,
                    height: expandedHeight,
                  ),
                ),
                itemCount: images.length,
                height: expandedHeight,
                onPageChanged: (p0, p1) {
                  setState(() {
                    activeImageIndex = p0;
                  });
                },
              ),
            if (images.isNotEmpty)
              PositionedDirectional(
                bottom: 30.h,
                end: 10.w,
                child: Card(
                  elevation: 0,
                  color: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: SizedBox(
                    height: 30.h,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.r),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            CupertinoIcons.photo_camera,
                            size: 16.sp,
                            color: AppColors.white,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            (activeImageIndex + 1).toString(),
                            style: TextStyles.rubik12W700White,
                          ),
                          Text(
                            '/',
                            style: TextStyles.rubik12W700White,
                          ),
                          Text(
                            images.length.toString(),
                            style: TextStyles.rubik12W700White,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            if (images.isEmpty) const EmptyWidget(),
          ],
        ),
      ),
      collapsedHeight: kToolbarHeight,
      toolbarHeight: kToolbarHeight,
      floating: false,
      pinned: true,
      snap: false,
    );
  }
}
