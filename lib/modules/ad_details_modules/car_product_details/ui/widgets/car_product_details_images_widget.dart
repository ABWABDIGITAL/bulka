import 'package:bulka/core/services/ad_details/controller/cubit/ad_details_cubit.dart';
import 'package:bulka/core/shared/entity/product_entities/ad_media_entity.dart';
import 'package:bulka/core/shared/widgets/carousal_widget.dart';
import 'package:bulka/core/shared/widgets/custom_smooth_indicator_widget.dart';
import 'package:bulka/core/shared/widgets/zoom_in_image_list_widget.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/extensions/extensions.dart';
import 'package:bulka/core/utils/widgets/misc/default_network_image.dart';
import 'package:bulka/core/utils/widgets/navigation/navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  List<String> images = [];
  @override
  initState() {
    super.initState();
    for (AdMediaEntity element
        in context.read<AdDetailsCubit>().adDetails!.adMedia) {
      images.add(element.media);
    }
  }

  @override
  Widget build(BuildContext context) {
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
