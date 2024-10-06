import 'package:bulka/core/shared/widgets/privacy_policy_screen.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/widgets/loading/adaptive_circuler.dart';
import 'package:bulka/core/utils/widgets/misc/customer_scroll_behaviour.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:photo_view/photo_view_gallery.dart';

// ignore: must_be_immutable
class ZoomImageListScreen extends StatefulWidget {
  final PageController pageController;
  List<dynamic> urlImage;
  final int index;
  int? originalLength;
  ZoomImageListScreen({
    super.key,
    required this.urlImage,
    required this.index,
    this.originalLength,
  }) : pageController = PageController(initialPage: index);

  @override
  // ignore: library_private_types_in_public_api
  _ZoomImageListScreenState createState() => _ZoomImageListScreenState();
}

class _ZoomImageListScreenState extends State<ZoomImageListScreen> {
  late int index = widget.index;

  @override
  void initState() {
    if (widget.originalLength != null) {
      if (widget.urlImage.length < widget.originalLength!) {
        index += (widget.urlImage.length - widget.originalLength!);
      }
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScrollConfiguration(
        behavior: MyCustomScrollBehavior(),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            PhotoViewGallery.builder(
              pageController: widget.pageController,
              scrollDirection: Axis.horizontal,
              loadingBuilder: (context, event) =>
                  const AdaptiveCircularProgress(),
              itemCount: widget.urlImage.length,
              builder: (context, index) {
                final url = widget.urlImage[index];
                return PhotoViewGalleryPageOptions(
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.info),
                  imageProvider: NetworkImage(url),
                  // minScale: PhotoViewComputedScale.contained,
                  // maxScale: PhotoViewComputedScale.contained * 4,
                );
              },
              onPageChanged: (index) => setState(() {
                this.index = index;
              }),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: CustomeHeadlineText(
                '${index + 1} / ${widget.urlImage.length}',
                color: AppColors.black,
                minFont: 15,
                maxFont: 18,
              ),
            ),
            PositionedDirectional(
              top: 20,
              start: 20,
              child: SafeArea(
                child: IconButton(
                  onPressed: () {
                    SchedulerBinding.instance.addPostFrameCallback((_) {
                      if (mounted) {
                        Navigator.pop(context);
                      }
                    });
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
