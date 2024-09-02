import 'package:bulka/core/assets/asset_icons.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DefaultNetworkImage extends StatelessWidget {
  const DefaultNetworkImage(
    this.image, {
    super.key,
    this.height,
    this.width,
    this.fit,
    this.placeholder,
    this.fromSliverList,
    this.loadingSize,
    this.needCache = true,
    this.filterQuality,
    this.needResizeImage = false,
    this.loadingImageSize,
  });

  final String image;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final Widget Function(BuildContext, String)? placeholder;
  final bool? fromSliverList;
  final double? loadingSize;
  final bool? needCache;
  final FilterQuality? filterQuality;
  final bool needResizeImage;
  final double? loadingImageSize;
  @override
  Widget build(BuildContext context) {
    return needCache!
        ? CachedNetworkImage(
            imageUrl: image,
            placeholder: placeholder ??
                (context, url) =>
                    fromSliverList != null && fromSliverList == true
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                AssetIcons.appTransparentIconX4,
                                height: loadingImageSize ?? 12,
                                width: loadingImageSize ?? 12,
                                fit: BoxFit.contain,
                              ),
                            ],
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                AssetIcons.appTransparentIconX4,
                                height: loadingImageSize ?? 12,
                                width: loadingImageSize ?? 12,
                                fit: BoxFit.contain,
                              ),
                            ],
                          ),
            //placeholderFadeInDuration: Duration.zero,
            //fadeOutDuration: Duration.zero,
            // maxWidthDiskCache: 4000,
            // maxHeightDiskCache: 2500,
            memCacheHeight: needResizeImage ? height?.toInt() : null,
            memCacheWidth: needResizeImage ? width?.toInt() : null,
            useOldImageOnUrlChange: true,
            filterQuality: filterQuality ?? FilterQuality.low,
            errorWidget: (context, url, error) => const Icon(Icons.error),
            height: height ?? MediaQuery.of(context).size.height,
            width: width ?? MediaQuery.of(context).size.width,
            fit: fit ?? BoxFit.cover,
            fadeInCurve: Curves.ease,
          )
        : Image.network(
            image,
            loadingBuilder: (context, url, _) =>
                fromSliverList != null && fromSliverList == true
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            AssetIcons.appTransparentIconX4,
                            height: loadingImageSize ?? 12,
                            width: loadingImageSize ?? 12,
                            fit: BoxFit.contain,
                          ),
                        ],
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            AssetIcons.appTransparentIconX4,
                            height: loadingImageSize ?? 12,
                            width: loadingImageSize ?? 12,
                            fit: BoxFit.contain,
                          ),
                        ],
                      ),
            errorBuilder: (context, url, error) => const Icon(Icons.error),
            height: height ?? MediaQuery.of(context).size.height,
            width: width ?? MediaQuery.of(context).size.width,
            fit: fit ?? BoxFit.cover,
          );
  }
}
