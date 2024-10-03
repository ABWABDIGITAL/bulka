import 'package:bulka/core/shared/widgets/carousal_widget.dart';
import 'package:bulka/core/shared/widgets/custom_smooth_indicator_widget.dart';
import 'package:bulka/core/shared/widgets/zoom_in_image_list_widget.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/extensions/extensions.dart';
import 'package:bulka/core/utils/widgets/misc/default_network_image.dart';
import 'package:bulka/core/utils/widgets/navigation/navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarProductDetailsImagesWidget extends StatefulWidget {
  const CarProductDetailsImagesWidget({super.key});

  @override
  State<CarProductDetailsImagesWidget> createState() =>
      _CarProductDetailsImagesWidgetState();
}

class _CarProductDetailsImagesWidgetState
    extends State<CarProductDetailsImagesWidget> {
  int activeImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<String> images = [
      'https://images.unsplash.com/photo-1517026575980-3e1e2dedeab4?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8Y2FyfGVufDB8fDB8fHww',
      'https://images.unsplash.com/photo-1498887960847-2a5e46312788?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8Y2FyfGVufDB8fDB8fHww',
      "https://images.unsplash.com/photo-1556448851-9359658faa54?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NTF8fGNhcnxlbnwwfHwwfHx8MA%3D%3D",
    ];
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        SharedCarousalWidget(
          enlargeCenterPage: false,
          itemBuilder: (context, index, reelIndex) => InkWell(
            onTap: () {
              Move.navigateToFade(
                  context, ZoomImageListScreen(urlImage: images, index: index));
            },
            child: DefaultNetworkImage(
              images[index],
              fit: BoxFit.cover,
              height: 370.h,
            ),
          ),
          itemCount: images.length,
          height: 370.h,
          onPageChanged: (p0, p1) {
            setState(() {
              activeImageIndex = p0;
            });
          },
        ),
        Padding(
          padding: EdgeInsetsDirectional.only(bottom: 20.r),
          child: CustomeSmoothIndicator(
            activeIndex: activeImageIndex,
            count: images.length,
          ),
        ),
        PositionedDirectional(
          top: 56.h,
          start: 10.w,
          child: CircleAvatar(
            backgroundColor: AppColors.grey.withOpacity(.7),
            child: IconButton(
              onPressed: () {
                context.pop();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: AppColors.black,
              ),
            ),
          ),
        ),
        PositionedDirectional(
          top: 50.h,
          end: 10.w,
          child: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: const Icon(
              CupertinoIcons.info,
              color: AppColors.white,
            ),
          ),
        )
      ],
    );
  }
}
